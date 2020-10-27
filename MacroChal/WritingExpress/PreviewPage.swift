//
//  PreviewPage.swift
//  MacroChalTestUnit
//
//  Created by Andrew Novansky Ignatius on 20/10/20.
//

import SwiftUI
import CoreData

struct PreviewPage: View {
    
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
//                    NavigationLink(destination: WayToGoPage()) {}
                },
                label: {
                    buttonStyleTemplate(text: "Next")
                }).padding()
        }
    }
}

struct WayToGoPage: View{
    @State var selectedDate = Date()
    var body: some View{
        VStack{
            TitleTemp(title: "Way to go!")
            SubtitleTemp(subtitle: "It’s a great experience today.I hope you learned something about yourself.Let’s meet again tomorrow!")
            
            Image("WayToGo!")
                .resizable()
                .frame(width: 286, height: 283, alignment: .center)
                .padding()
            SubtitleTemp(subtitle: "See you at")
            
            DatePicker("", selection: $selectedDate, displayedComponents: .hourAndMinute)
                .datePickerStyle(CompactDatePickerStyle())
                .labelsHidden()
                .frame(alignment: .center)
                .accentColor(Color("FontColor"))
                .padding()
            Text("\(selectedDate.advanced(by: 86400))")
            NavigationLink(
                destination: GoodJobPage(),
                label: {
                    buttonStyleTemplate(text: "Next")
                }).padding()
        }
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
                .padding()
            NavigationLink(
                destination: AcceptancePage(),
                label: {
                    buttonStyleTemplate(text: "See you!")
                }).padding()
        }
    }
}

struct PreviewPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewPage(heartOn: true)
        WayToGoPage()
        GoodJobPage()
    }
}
