//
//  CalendarDetails.swift
//  Onboarding try
//
//  Created by Jenifer Yolanda on 25/10/20.
//

import SwiftUI
import CoreData

let data = DiaryDatabase()

struct CalendarDetails: View {
    @Environment(\.calendar) var calendar
    @State var components = DateComponents()
    @State var desiredDate = Date()
    @State var collectionView = false
    @State var calendarInput = Date()
    
    private var weekly: DateInterval {
        var weekComponent = DateComponents()
        weekComponent.day = 1
        let endDate = self.calendar.date(byAdding: weekComponent, to: self.desiredDate) ?? Date()
        return DateInterval(start: Date(), end: endDate)
    }
    
    
    var body: some View {
        ScrollView{
            CalendarView(interval: weekly) { date in
                VStack {
                    HStack{
                        Text("300")
                    }.font(.body)
                    .hidden()
                    .padding(7)
                    .overlay(
                        VStack{
                            Text(String(self.calendar.component(.day, from: date)))
                                .foregroundColor(Color.accentColor).font(.body)
                            //tarik data warna image
                            Image("Emotion").resizable().frame(width: 10, height: 10).offset(y: -10)
                            //Image(self.data.ColorImg)
                        }.onTapGesture{
                            //print("Masuk?")
                            self.components.month = self.calendar.component(.month, from: date)
                            
                                                        self.components.day = self.calendar.component(.day, from: date)
                                                        self.components.year = self.calendar.component(.year, from: date)
                            
                            collectionView.toggle()
                        }
                    )
                }
            }
            if collectionView{
                VStack{
                    DayView(date: self.calendar.date(from: self.components) ?? Date())
                    
                    Text("Your writings that day:")
                    .font(.headline)
                    .fontWeight(.regular)
                    HistoryCollectionView()
                }
            }
        }
    }
}

//.onTapGesture {
//                      self.showingDayView.toggle()
//
//                  self.components.month = self.calendar.component(.month, from: date)
//                  self.components.day = self.calendar.component(.day, from: date)
//                  self.components.year = self.calendar.component(.year, from: date)
//
//                 }.sheet(isPresented: self.$showingDayView) {
//                   DayView(date: self.calendar.date(from: self.components) ?? Date())
//                }
//            )
//          }
//        }
//      }.padding()
//    }
//}
//
//struct DayView: View {
//  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//
//  var date: Date
//
//  var dateFormatter: DateFormatter {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    return formatter
//  }

struct HistoryCollectionView: View {
    
    var body: some View {
        
        VStack {
            List {
                ForEach(0..<5) { item in
                    CollectionView()
                }
                //CollectionView()
            }
            
//            List {
//                ForEach(data) { item in
//                    ForEach(0..<1) { item in
//                        CollectionView(data: item)
//                    }
//                }
//            }
        }.frame(height: 400)
    }
    
}

struct CollectionView: View {

    var body: some View {
        VStack {
            HStack{
                Image("\(data.emotionChoosen ?? "angry")").resizable().frame(width:70, height:70).offset(x:-50)
                
                VStack(alignment: .leading){
                    Text("\(data.timestamp!)").padding(1)
                    Text(data.story!)
                }.offset(x:-40)
                
                VStack{
                    Text("\(data.timestamp!)")
                    if data.heartOn == true{
                        Image("Heart.Fill")
                            .renderingMode(.none)
                            .font(.system(size: 45))
                            .padding()
                    }else if data.heartOn == false{
                        Image("Heart")
                            .renderingMode(.none)
                            .font(.system(size: 45))
                            .padding()
                    }
                }.offset(x:50)
            }
            
        }.frame(width:350, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).padding(5).background(Color("WriteColor")).cornerRadius(20)//.onTapGesture {
        //   /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/
        // }
    }
}

struct DayView: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
  var date: Date
    
  var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
  }
    
  var body: some View {
    VStack {
      Text(self.dateFormatter.string(from: self.date))
    }
  }
}
struct CalendarDetails_Previews: PreviewProvider {
    static var previews: some View {
        CalendarDetails()

    }
}
