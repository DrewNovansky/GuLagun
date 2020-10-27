//
//  BreathingPage.swift
//  MacroChal
//
//  Created by Steven Rafaelie on 23/10/20.
//

import SwiftUI

struct BreathingPage: View {
    
    var timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    //var count = 0
    @State var kondisi = ["apiSedang", "apiKecil", "apiBesar"]
    @State var count: Int = 0
    
    var body: some View {
        VStack {
            TitleTemp(title: "Take a Deep Breath")
            SubtitleTemp(subtitle: "Inhale for 4 seconds \(count)")
                .onReceive(timer) {input in
                    //self.count += 1
                }
            Spacer()
            
            FireAnimation(imageName: "apiBesar", x: 0, y: 0, width: 300, height: 300)
                .frame(width: 300, height: 325, alignment: .center)
                .onReceive(timer) {input in
                    self.count += 1
                }
            Spacer()
            ProgressView(value: 0.5)
                .padding()
            NavigationLink(destination: EmotionPage()) {
                buttonStyleTemplate(text: "Next")
                    
            }
            //.hidden()
        }
    }
}

struct BreathingPage_Previews: PreviewProvider {
    static var previews: some View {
        BreathingPage()
    }
}
