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
            FireAnimation(imageName: "apiBesar", x: 0, y: 0, width: 300, height: 300)
                .frame(width: 300, height: 325, alignment: .center)
            TitleTemp(title: "Focus Breathing")
            VStack(){
            BreathingInstruction(imageName: "HeartFilled", instruction: "Inhale for 4 seconds")
            BreathingInstruction(imageName: "HeartFilled", instruction: "Hold for 4 seconds")
            BreathingInstruction(imageName: "HeartFilled", instruction: "Exhale for 4 seconds")
            BreathingInstruction(imageName: "HeartFilled", instruction: "Hold for 4 seconds")
            }
            Spacer()
            SubtitleTemp(subtitle: "1 session consist of 4 breaths 01:04 Min")
                .padding()
            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                buttonStyleTemplate(text: "Begin Breathing")
            }
            
        }
    }
}

struct FocusBreathingPage_Previews: PreviewProvider {
    static var previews: some View {
        FocusBreathingPage()
    }
}

