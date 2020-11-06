//
//  FocusBreathingPage.swift
//  MacroChal
//
//  Created by Steven Rafaelie on 23/10/20.
//

import SwiftUI

struct FocusBreathingPage: View {
    var body: some View {
        VStack{
            FireAnimation(imageName: "apiKecil", x: 0, y: 0, width: 300, height: 300)
                .frame(width: 300, height: 325, alignment: .center)
            TitleTemp(title: "Focus Breathing")
            SubtitleTemp(subtitle: "Breathing helps you to be more relax before your start writing your reflection. ")
            //padding()
            VStack(){
                BreathingInstruction(imageName: "FC_1", instruction: "Inhale for 4 seconds")
                BreathingInstruction(imageName: "FC_2", instruction: "Hold for 4 seconds")
                BreathingInstruction(imageName: "FC_3", instruction: "Exhale for 4 seconds")
                BreathingInstruction(imageName: "FC_4", instruction: "Hold for 4 seconds")
            }
            Spacer()
            SubtitleTemp(subtitle: "1 session consist of 4 breaths 01:00 Min")
                .padding()
            NavigationLink(destination: BreathingPage()) {
                buttonStyleTemplate(text: "Begin Breathing")
            }.padding()
        }
    }
}

struct FocusBreathingPage_Previews: PreviewProvider {
    static var previews: some View {
        FocusBreathingPage()
    }
}

