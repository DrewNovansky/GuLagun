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
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
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
        }
    }
}

struct WayToGoPage: View{
    @State var selectedDate = Date()
    @State var showView = false
    var body: some View{
        VStack{
            TitleTemp(title: "Way to go!")
                .padding()
            SubtitleTemp(subtitle: "It’s a great experience today.\nI hope you learned something about yourself.\nLet’s meet again tomorrow!")
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            Image("WayToGo!")
                .resizable()
                .frame(width: 286, height: 283, alignment: .center)
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            SubtitleTemp(subtitle: "See you at")
            
            DatePicker("", selection: $selectedDate, displayedComponents: .hourAndMinute)
                .datePickerStyle(CompactDatePickerStyle())
                .labelsHidden()
                .frame(alignment: .center)
                .accentColor(Color("FontColor"))
                .padding()
            
            let components =
                Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: selectedDate.advanced(by: 86400))
            
            NavigationLink(destination: GoodJobPage(), isActive: $showView) {
                Button(
                    //destination: WayToGoPage(),
                    action: {
                        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound])  {
                            success, error in
                            if success {
                                print("authorization granted")
                            } else if error != nil {
                                print("Error found")
                            }
                            
                            
                        }
                        let content = UNMutableNotificationContent()
                        content.title = "Are you ready to go to the ForRest?"
                        content.body = "How's your day so far? Let's express together with Boo."
                        content.sound = UNNotificationSound.default
                        
                        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
                        
                        let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
                        
                        UNUserNotificationCenter.current().add(request)
                        self.showView = true
                        let center = UNUserNotificationCenter.current()
                        center.getPendingNotificationRequests(completionHandler: { requests in
                            for request in requests {
                                print(request)
                            }
                        })
                    },
                    label: {
                        buttonStyleTemplate(text: "Next")
                    }).padding()
            }
        }.offset(y:-UIScreen.main.bounds.height*0.08)
    }
}

struct GoodJobPage: View {
    var body: some View{
        VStack{
            TitleTemp(title: "Great job!")
                .padding()
            SubtitleTemp(subtitle: "We’ll remind you again tomorrow, see you!")
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            Image("SeeYou!")
                .resizable()
                .frame(width: 286, height: 283, alignment: .center)
                .padding()
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            NavigationLink(
                destination: BonFireView(),
                label: {
                    buttonStyleTemplate(text: "See you!")
                })
        }.offset(y:-UIScreen.main.bounds.height*0.08)
    }
}

struct PreviewPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewPage(heartOn: true)
        WayToGoPage()
        GoodJobPage()
    }
}
