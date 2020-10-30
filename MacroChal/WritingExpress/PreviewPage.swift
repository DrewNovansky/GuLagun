//
//  PreviewPage.swift
//  MacroChalTestUnit
//
//  Created by Andrew Novansky Ignatius on 20/10/20.
//

import SwiftUI
import CoreData

struct PreviewPage: View {
    @State var showView = false
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [])
    private var diary: FetchedResults<DiaryDatabase>
    // hasil passing data
    var emotionChoosen = ""
    var emotionDetails = "Grateful"
    var story = ""
    var acceptenceText = ""
    var heartOn:Bool
    var date = Date()
    var body: some View {
        
        VStack{
            reviewTemp(emotionChoosen: emotionChoosen, emotionDetails: emotionDetails, story: story, acceptenceText: acceptenceText, heartOn: heartOn)
            NavigationLink(destination: WayToGoPage(), isActive: $showView) {
                Button(
                    //destination: WayToGoPage(),
                    action: {
                        let diary = DiaryDatabase(context: viewContext)
                        diary.emotionChoosen = self.emotionChoosen
                        diary.acceptanceText = self.acceptenceText
                        diary.emotionDetail = self.emotionDetails
                        diary.heartOn = self.heartOn
                        diary.story = self.story
                        diary.timestamp = self.date
                        //Save context
                        do {
                            try viewContext.save()
                            print("Saved")
                        } catch {
                            let error = NSError.self
                            fatalError("UnresolvedError \(error)")
                        }
                        self.showView = true
                        
                    },
                    label: {
                        buttonStyleTemplate(text: "Next")
                    }).padding()
            }
        }.offset(y:-50)
    }
}

struct WayToGoPage: View{
    @State var selectedDate = Date()
    var body: some View{
        VStack{
            TitleTemp(title: "Way to go!")
            SubtitleTemp(subtitle: "It’s a great experience today.\nI hope you learned something about yourself.\nLet’s meet again tomorrow!")
            
            Image("WayToGo!")
                .resizable()
                .frame(width: 286, height: 283, alignment: .center)
            SubtitleTemp(subtitle: "See you at")
            
            DatePicker("", selection: $selectedDate, displayedComponents: .hourAndMinute)
                .datePickerStyle(CompactDatePickerStyle())
                .labelsHidden()
                .frame(alignment: .center)
                .accentColor(Color("FontColor"))
            Text("\(selectedDate.advanced(by: 86400))").hidden()
            NavigationLink(
                destination: GoodJobPage(),
                label: {
                    buttonStyleTemplate(text: "Next")
                })
        }.offset(y:-50)
    }
}

struct GoodJobPage: View {
    var body: some View{
        VStack{
            TitleTemp(title: "Great job!")
            SubtitleTemp(subtitle: "We’ll remind you again tomorrow, see you!")
            Image("SeeYou!")
                .resizable()
                .frame(width: 286, height: 283, alignment: .center)
                .offset(y:50)
                .padding()
            NavigationLink(
                destination: BonFireView(),
                label: {
                    buttonStyleTemplate(text: "See you!")
                }).offset(y:200).padding()
        }.offset(y:-150)
    }
}

struct PreviewPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewPage(heartOn: true)
        WayToGoPage()
        GoodJobPage()
    }
}
