//
//  PreviewPage.swift
//  MacroChalTestUnit
//
//  Created by Andrew Novansky Ignatius on 20/10/20.
//

import SwiftUI

struct PreviewPage: View {
    // hasil passing data
    var emotionChoosen = ""
    var emotionDetails = "Grateful"
    var story = ""
    var acceptenceText = ""
    var heartOn = true
    var body: some View {
        VStack{
            reviewTemp(emotionChoosen: emotionChoosen)
            NavigationLink(
                destination: WayToGoPage(),
                label: {
                    buttonStyleTemplate(text: "Next")
                })
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
            SubtitleTemp(subtitle: "See you at")
            
            DatePicker("", selection: $selectedDate, displayedComponents: .hourAndMinute)
                .datePickerStyle(CompactDatePickerStyle())
                .labelsHidden()
                .frame(alignment: .center)
                .accentColor(Color("FontColor"))
            
            Text("\(selectedDate)")
            NavigationLink(
                destination: GoodJobPage(),
                label: {
                    buttonStyleTemplate(text: "Next")
                })
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
                .frame(width: 286, height: 283, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            NavigationLink(
                destination: AcceptancePage(),
                label: {
                    buttonStyleTemplate(text: "See you!")
                })
        }
    }
}

struct PreviewPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewPage()
        WayToGoPage()
        GoodJobPage()
    }
}
