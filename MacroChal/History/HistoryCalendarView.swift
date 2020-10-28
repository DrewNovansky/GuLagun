//
//  HistoryCalendarView.swift
//  Onboarding try
//
//  Created by Jenifer Yolanda on 24/10/20.
//

import SwiftUI

struct HistoryCalendarView: View {
    @Environment(\.calendar) var calendar
    private var year: DateInterval {
        calendar.dateInterval(of: .month, for: Date())!
    }
    
    var body: some View {
        VStack{
            CalendarView(interval: self.year) {
                date in Text("30")
                    .hidden()
                    .padding(12)
                    //munculin tangal
                    .overlay(Text(String(self.calendar.component(.day, from: date)))
                                .foregroundColor(.accentColor)
                            
                    )
            }
        }
//        }.onTapGesture{
//            print("Kepencet")
//        }
    }
}

struct HistoryCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryCalendarView()
    }
}

fileprivate extension DateFormatter {
    static var Date: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter
    }
}

fileprivate extension Calendar {
    func generateDates(
        inside interval: DateInterval,
        matching components: DateComponents
    ) -> [Date] {
        var dates: [Date] = []
        dates.append(interval.start)
        
        enumerateDates(
            startingAfter: interval.start,
            matching: components,
            matchingPolicy: .nextTime
        ) { date, _, stop in
            if let date = date {
                if date < interval.end {
                    dates.append(date)
                } else {
                    stop = true
                }
            }
        }
        return dates
    }
}

struct WeekView<DateView>: View where DateView: View {
    @Environment(\.calendar) var calendar
    
    let week: Date
    let content: (Date) -> DateView
    
    init(week: Date, @ViewBuilder content: @escaping (Date) -> DateView) {
        self.week = week
        self.content = content
    }
    
    private var days: [Date] {
        guard
            let weekInterval = calendar.dateInterval(of: .weekOfYear, for: week)
        else { return [] }
        return calendar.generateDates(
            inside: weekInterval,
            matching: DateComponents(hour: 0, minute: 0, second: 0)
        )
    }
    
    var body: some View {
        HStack {
            ForEach(days, id: \.self) { date in
                VStack {
                    HStack {//print dates
                        if self.calendar.isDate(self.week, equalTo: date, toGranularity: .month) {//granularity = compare dates
                            self.content(date)
                        } else {
                            self.content(date)
                        }
                    }
                }
            }
        }
    }
}


struct MonthView<DateView>: View where DateView: View {
    @Environment(\.calendar) var calendar
    
    @State private var month: Date
    let showHeader: Bool
    let content: (Date) -> DateView
    
    init(
        month: Date,
        showHeader: Bool = true,
        localizedWeekdays: [String] = [],
        @ViewBuilder content: @escaping (Date) -> DateView
    ) {
        self._month = State(initialValue: month)
        self.content = content
        self.showHeader = showHeader
    }
    
    private var weeks: [Date] {
        guard
            let monthInterval = calendar.dateInterval(of: .weekOfMonth, for: month)
        else { return [] }
        return calendar.generateDates(
            inside: monthInterval,
            matching: DateComponents(hour: 0, minute: 0, second: 0, weekday: calendar.firstWeekday)
        )
    }
    
    func changeDateBy(_ months: Int) {
        if let date = Calendar.current.date(byAdding: .weekOfMonth, value: months, to: month) {
            self.month = date
        }
    }
    
    //header
    private var header: some View {
        let component = calendar.component(.month, from: month)
        let formatter = component == 1 ? DateFormatter.Date : .Date
        
        return HStack{
                    //ganti bulan last month
                    Button(action: {
                        self.changeDateBy(-1)
                    }) {
                        Image("PrevBtnCalendar")
                            .resizable().frame(width: 25)
                    }
                  
            Text(formatter.string(from: month))
                .font(.body)
                .foregroundColor(.accentColor)
                    //ganti bulan next month
                    Button(action: {
                        self.changeDateBy(1)
                    }) {
                        Image("NextBtnCalendar")
                            .resizable().frame(width: 25)
            }
        }.frame(height: 25)
    }
    
    var body: some View {
        VStack {
            if showHeader {
                header
            }
            HStack{
                ForEach(0..<7, id: \.self) {index in
                    Text("30")
                        .hidden()
                        .padding(8)
                        .padding(.horizontal, 4)
                        .overlay(
                            Text(getWeekDaysSorted()[index].uppercased())
                                .fontWeight(.semibold)
                                .foregroundColor(Color("AccentColor")))//weekday name (sun,mon,dkk)
                }
            }
            
            ForEach(weeks, id: \.self) { week in
                WeekView(week: week, content: self.content)
            }
        }
    }
    //weekdays
    func getWeekDaysSorted() -> [String]{
        let weekDays = Calendar.current.shortWeekdaySymbols
        let sortedWeekDays = Array(weekDays[Calendar.current.firstWeekday - 1 ..< Calendar.current.shortWeekdaySymbols.count] + weekDays[0 ..< Calendar.current.firstWeekday - 1])
        return sortedWeekDays
    }
}

struct CalendarView<DateView>: View where DateView: View {
    @Environment(\.calendar) var calendar
    
    let interval: DateInterval
    let content: (Date) -> DateView
    
    init(interval: DateInterval, @ViewBuilder content: @escaping (Date) -> DateView) {
        self.interval = interval
        self.content = content
    }
    
    private var months: [Date] {
        calendar.generateDates(
            inside: interval,
            matching: DateComponents(day: 1, hour: 0, minute: 0, second: 0)
        )
    }
    
    var body: some View {
        
        ForEach(months, id: \.self) { month in
            MonthView(month: month, content: self.content)

        }
    }
}
