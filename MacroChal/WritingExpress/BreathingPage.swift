//
//  BreathingPage.swift
//  MacroChal
//
//  Created by Steven Rafaelie on 23/10/20.
//

import SwiftUI

struct BreathingPage: View {
    
    var timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    @State var kondisi = ["Inhale for 4 Seconds", "Hold for 4 Seconds", "Exhale for 4 Seconds", "Good Job!"]
    @State var count: Int = 0
    
    
    var body: some View {
        VStack {
            TitleTemp(title: "Take a Deep Breath")
            SubtitleTemp(subtitle: kondisi[count])
                .onReceive(timer) {input in
                    if count < kondisi.count-1 {
                        self.count += 1
                    } else {
                        self.timer.upstream.connect().cancel()
                    }
                }
            Spacer()
            if count < kondisi.count-1 {
            FireAnimation(imageName: "apiSemua", x: 0, y: 0, width: 300, height: 300)
                .frame(width: 300, height: 325, alignment: .center)
            } else {
                Image("Great!")
            }
            Spacer()
            ProgressView(value: 0.5)
                .padding()
            if count < kondisi.count-1 {
            NavigationLink(destination: EmotionPage()) {
                buttonStyleTemplate(text: "Next")
            }.hidden()
            } else {
                NavigationLink(destination: EmotionPage()) {
                    buttonStyleTemplate(text: "Next")
                }
            }
        }.offset(y:-50)
    }
}

struct BreathingPage_Previews: PreviewProvider {
    static var previews: some View {
        BreathingPage()
    }
}
