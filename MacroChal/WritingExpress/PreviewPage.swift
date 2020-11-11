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
    var emotionChoosen = "Joy"
    var emotionDetails = "Grateful"
    @State var story = ""
    @State var acceptenceText = ""
    @State var heartOn:Bool
    var date = Date()
    @State var keyboardState = false
    @State var editOn = false
    
    var body: some View {
        VStack{
            ScrollView{
                HStack{
                    if keyboardState{
                        Text("")
                            .navigationBarItems(trailing:
                                                    HStack{
                                                        Button(action: {
                                                            hideKeyboard()
                                                            keyboardState = false
                                                        }
                                                        , label: {
                                                            Text("Done")
                                                                .padding(5)
                                                            
                                                        }
                                                        )
                                                    })
                    }
                    else {
                        Text("")
                            .navigationBarItems(trailing:
                                                    HStack{
                                                        Text("")
                                                    })
                    }
                }
                if editOn == true{
                    VStack{
                        Image(emotionChoosen)
                            .padding()
                        SubtitleTemp(subtitle: "I feel \(emotionDetails)")
                        multilineTF(placeholder: story, textWritten: $story, keyboardState: $keyboardState)
                        Button(action: {
                            self.heartOn.toggle()
                        }, label: {
                            VStack(spacing: 5){
                                Text("Tap the heart if you do")
                                    .foregroundColor(Color("FontColor"))
                                //button image toogle (Not Yet)
                                if heartOn == true{
                                    Image("Heart.Fill")
                                        .renderingMode(.none)
                                        .font(.system(size: 62))
                                }else if heartOn == false{
                                    Image("Heart")
                                        .renderingMode(.none)
                                        .font(.system(size: 62))
                                }
                            }
                        })
                        //hasil passing data
                        multilineTF(placeholder: acceptenceText, textWritten: $acceptenceText,keyboardState: $keyboardState)
                    }
                }else{
                    reviewTemp(emotionChoosen: emotionChoosen, emotionDetails: emotionDetails, story: story, acceptenceText: acceptenceText, heartOn: heartOn)
                        .padding(.bottom)
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
            }
            Button(action: {
                editOn.toggle()
            }, label: {
                if editOn == true
                {
                    buttonStyleTemplate(text: "Done")
                }else
                {
                    buttonTemplate(funcActive: false, emotion: "Edit")
                        .offset(y:UIScreen.main.bounds.height*0.03)
                }
            }
            )
            if editOn == false{
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
                }.offset(y:UIScreen.main.bounds.height*0.03)
            }
        }.offset(y:-UIScreen.main.bounds.height*0.03)
    }
}

struct WayToGoPage: View{
    @State var selectedDate = Date()
    @State var showView = false
    var body: some View{
        VStack{
            TitleTemp(title: "Way to go!")
        }.offset(y: -UIScreen.main.bounds.height*0.05)
        ScrollView{
            SubtitleTemp(subtitle: "It’s a great experience today.\nI hope you learned something about yourself.\nLet’s meet again tomorrow!")
                .padding()
            Image("WayToGo!")
                .resizable()
                .frame(width: UIScreen.main.bounds.width*0.7, height: UIScreen.main.bounds.width*0.7, alignment: .center)
            SubtitleTemp(subtitle: "See you at")
                .padding()
            DatePicker("", selection: $selectedDate, displayedComponents: .hourAndMinute)
                .datePickerStyle(CompactDatePickerStyle())
                .labelsHidden()
                .frame(alignment: .center)
                .accentColor(Color("FontColor"))
                .padding()
        }
        VStack{
            let components = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: selectedDate.advanced(by: 86400))
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
        }
    }
}

struct GoodJobPage: View {
    var body: some View{
        VStack{
            TitleTemp(title: "Great job!")
                //.padding()
            SubtitleTemp(subtitle: "We’ll remind you again tomorrow, see you!")
            Text("").frame(height:UIScreen.main.bounds.height*0.1)
            Image("SeeYou!")
                .resizable()
                .frame(width: UIScreen.main.bounds.width*0.7, height: UIScreen.main.bounds.width*0.7, alignment: .center)
                .padding()
            Text("").frame(height:UIScreen.main.bounds.height*0.15)
            NavigationLink(
                destination: BonFireView(),
                label: {
                    buttonStyleTemplate(text: "See you!")
                })
                .padding(.top, 30.0)
                .offset(y: UIScreen.main.bounds.height*0.03)
        }
        .offset(y:-UIScreen.main.bounds.height*0.04)
    }
}

struct PreviewPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewPage(heartOn: true)
        WayToGoPage()
        GoodJobPage()
    }
}
