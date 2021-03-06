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
            ScrollView(showsIndicators: false){
//                Text("").frame(height: UIScreen.main.bounds.width*0.1)
                FireAnimation(imageName: "apiKecil", x: Int(UIScreen.main.bounds.width/15), y: Int(-UIScreen.main.bounds.height)/25, width: Int((UIScreen.main.bounds.width*0.176)*5),height: Int((UIScreen.main.bounds.width*0.149)*5))
                    .frame(height: (UIScreen.main.bounds.width*0.149)*3.4)
                    .offset(y: -UIScreen.main.bounds.height/15)
                TitleTemp(title: "Focus Breathing")
                    .padding(.bottom, 2.0)
                SubtitleTemp(subtitle: "This breathing uses abdominal breathing\nwhich will help you to be more calm\nbefore you start expressing yourself.")
                
                VStack(){
                    BreathingInstruction(imageName: "FC_1", instruction: "Inhale for 4 seconds")
                    BreathingInstruction(imageName: "FC_2", instruction: "Hold for 4 seconds")
                    BreathingInstruction(imageName: "FC_3", instruction: "Exhale for 4 seconds")
                    BreathingInstruction(imageName: "FC_4", instruction: "Hold for 4 seconds")
                }
                .padding(3)
                SubtitleTemp(subtitle: "1 session will last for 1 Min")
                    .padding(2)
                SubtitleTemp(subtitle: "Place one hand on your upper chest\nand another on your belly button.")
            }
            NavigationLink(destination: BreathingPage()) {
                buttonStyleTemplate(text: "Begin Breathing")
            }.padding()
        }.offset(y:-UIScreen.main.bounds.height*0.001)
    }
}

struct FocusBreathingPage_Previews: PreviewProvider {
    static var previews: some View {
        FocusBreathingPage()
    }
}

