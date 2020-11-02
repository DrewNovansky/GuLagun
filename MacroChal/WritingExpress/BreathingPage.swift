//
//  BreathingPage.swift
//  MacroChal
//
//  Created by Steven Rafaelie on 23/10/20.
//

import SwiftUI

struct BreathingPage: View {
    
    var timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    @State var kondisi = ["Inhale for 4 Seconds", "Hold for 4 Seconds", "Exhale for 4 Seconds","Hold for 4 Seconds","Inhale for 4 Seconds", "Hold for 4 Seconds", "Exhale for 4 Seconds","Hold for 4 Seconds","Inhale for 4 Seconds", "Hold for 4 Seconds", "Exhale for 4 Seconds","Hold for 4 Seconds","Inhale for 4 Seconds", "Hold for 4 Seconds", "Exhale for 4 Seconds","Hold for 4 Seconds", "Now that you are more focus,\nlet’s start imagining how your day went today."]
    @State var title = ["Take a deep breath","Keep your breath","Release breath slowly", "Keep your breath","Take a deep breath","Keep your breath","Release breath slowly", "Keep your breath","Take a deep breath","Keep your breath","Release breath slowly", "Keep your breath","Take a deep breath","Keep your breath","Release breath slowly", "Keep your breath", "Great Job!"]
    @State var count: Int = 0
    
    
    var body: some View {
        VStack {
            TitleTemp(title: title[count])
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
            ProgressView(value: buatProgress(atas: count, bawah: kondisi.count))
                .frame(width: 374)
                .accentColor(Color(.systemBlue))
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
    func buatProgress(atas: Int, bawah: Int)-> Float {
        var atasFloat = Float(atas)
        atasFloat += 1
        let bawahFloat = Float(bawah)
        let hasil = atasFloat / bawahFloat
        return hasil
    }
    
}

struct BreathingPage_Previews: PreviewProvider {
    static var previews: some View {
        BreathingPage()
    }
}
