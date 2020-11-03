//
//  BreathingPage.swift
//  MacroChal
//
//  Created by Steven Rafaelie on 23/10/20.
//

import SwiftUI

struct BreathingPage: View {
    var timerDetik = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    @State var detikOutput = 1
    
    @State var count: Int = 0
    var pengulangan = 4
    
    var body: some View {
        VStack {
            TitleTemp(title: penggandaInstruksi(jumlah: pengulangan, output: "title")[count])
            SubtitleTemp(subtitle: penggandaInstruksi(jumlah: pengulangan, output: "subtitle")[count])
                .onReceive(timer) {input in
                    if count < penggandaInstruksi(jumlah: pengulangan, output: "title").count-1 {
                        self.count += 1
                    } else {
                        self.timer.upstream.connect().cancel()
                    }
                }
            SubtitleTemp(subtitle: "\(detikOutput)").onReceive(timerDetik, perform: { _ in
                if count < penggandaInstruksi(jumlah: pengulangan, output: "title").count - 1 {
                    if detikOutput <  4 {
                        detikOutput += 1
                    } else {
                        detikOutput = 1
                    }
                } else {
                    detikOutput = 0
                    self.timerDetik.upstream.connect().cancel()
                }
            }
            )
            Spacer()
            if count < penggandaInstruksi(jumlah: pengulangan, output: "subtitle").count - 1 {
                FireAnimation(imageName: "apiSemua", x: 0, y: 0, width: 300, height: 300)
                    .frame(width: 300, height: 325, alignment: .center)
            } else {
                Image("Great!")
            }
            Spacer()
            ProgressView(value: buatProgress(atas: count, bawah: penggandaInstruksi(jumlah: pengulangan, output: "title").count))
                .padding()
            if count < penggandaInstruksi(jumlah: pengulangan, output: "title").count-1 {
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
    func penggandaInstruksi(jumlah: Int, output: String)-> [String] {
        var berapa = 0
        var SubtitleOutput = [String]()
        var TitleOutput = [String]()
        let subtitleInput =  ["Inhale for 4 Seconds", "Hold for 4 Seconds", "Exhale for 4 Seconds","Hold for 4 Seconds"]
        let titleInput = ["Take a deep breath","Keep your breath","Release breath slowly", "Keep your breath"]
        if output == "subtitle" {
            while berapa < jumlah {
                SubtitleOutput.append(contentsOf: subtitleInput)
                berapa += 1
            }
            SubtitleOutput.append("Now that you are more focus,\nlet’s start imagining how your day went today.")
            return SubtitleOutput
        } else {
            while berapa < jumlah {
                TitleOutput.append(contentsOf: titleInput)
                berapa += 1
                
            }
            TitleOutput.append("Great Job!")
            return TitleOutput
        }
    }
}

struct BreathingPage_Previews: PreviewProvider {
    static var previews: some View {
        BreathingPage()
    }
}
