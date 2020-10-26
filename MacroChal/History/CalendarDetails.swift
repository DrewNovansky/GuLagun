//
//  CalendarDetails.swift
//  Onboarding try
//
//  Created by Jenifer Yolanda on 25/10/20.
//

import SwiftUI

struct DataModel: Identifiable {
    let id: String
    let date: String
    let feeling: String
    let time: String
    let emotionImg: String
    let heartImg: String
}

struct CalendarDetails: View {
    @Environment(\.calendar) var calendar
    @State var components = DateComponents()
    @State var desiredDate = Date()
    @State var collectionView = false
    
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
                            collectionView.toggle()
                        }
                    )
                }
            }
            if collectionView{
                VStack{
                    Text("Your writings that day:")
                    .font(.headline)
                    .fontWeight(.regular)
                    HistoryCollectionView()
                }
            }
        }
    }
}

struct HistoryCollectionView: View {
    
    let data: [DataModel] = [
        .init(id: "0", date: "26 Oct 2020", feeling: "I feel Mad", time: "11:00", emotionImg: "Emotion", heartImg: "HeartFilled"),
        .init(id: "0", date: "26 Oct 2020", feeling: "I feel Angry", time: "12:00", emotionImg: "Emotion", heartImg: "HeartOutline"),
    ]
    
    var body: some View {
        
        VStack {
            List {
                ForEach(data) { items in
                    ForEach(0..<1) { item in
                        CollectionView(data: items)
                    }
                }
            }
        }.frame(height: 400)
    }
    
}

struct CollectionView: View {
    let data: DataModel
    var body: some View {
        VStack {
            HStack{
                Image(self.data.emotionImg).resizable().frame(width:70, height:70).offset(x:-50)
                
                VStack(alignment: .leading){
                    Text(self.data.date).padding(1)
                    Text(self.data.feeling)
                }.offset(x:-40)
                
                VStack{
                    Text(self.data.time)
                    Image(self.data.heartImg).resizable().frame(width: 45, height: 40)
                }.offset(x:50)
            }
            
        }.frame(width:350, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).padding(5).background(Color("YellowButton")).cornerRadius(30)//.onTapGesture {
        //   /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/
        // }
    }
}
struct CalendarDetails_Previews: PreviewProvider {
    static var previews: some View {
        CalendarDetails()

    }
}
