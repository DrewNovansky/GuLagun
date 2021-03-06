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
    @State var detikOutput = 4
    @State var countDown:String = "4"
    @State var count: Int = 1
    var pengulangan = 4
    @State var TimerAtasDetik = 1
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        Text("")
            .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action:
                                                {
                                                    self.mode.wrappedValue.dismiss()
                                                    self.timer.upstream.connect().cancel()
                                                    self.timerDetik.upstream.connect().cancel()
                                                }
                                               , label: {
                HStack{
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .accentColor(Color("AccentColor"))
                Text("Back")
                    .fontWeight(.regular)
                    .foregroundColor(Color("AccentColor"))
                }
            }))
        
        VStack {TitleTemp(title: penggandaInstruksi(jumlah: pengulangan, output: "title")[count])
            .padding()
            .onReceive(timer) {input in
                if count < penggandaInstruksi(jumlah: pengulangan, output: "title").count-1 {
                    self.count += 1
                } else {
                    self.timer.upstream.connect()
                        .cancel()
                }
            }
            if count >= penggandaInstruksi(jumlah: pengulangan, output: "subtitle").count - 1 {
                SubtitleTemp(subtitle: penggandaInstruksi(jumlah: pengulangan, output: "subtitle")[count])
            }
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            ZStack{
                if count < penggandaInstruksi(jumlah: pengulangan, output: "subtitle").count - 1 {
                    FireAnimation(imageName: "apiSemua", x: 0, y: 0, width: 300, height: 300)
                        .frame(width: 300, height: 325, alignment: .center)
                } else {
                    Image("BooComingSoon")
                }
                VStack{
                    TitleTemp(title: "\(countDown)")
                        .onReceive(timerDetik, perform: { _ in
                            if count < penggandaInstruksi(jumlah: pengulangan, output: "title").count - 1 {
                                if detikOutput >  1 {
                                    detikOutput -= 1
                                    self.countDown = "\(detikOutput)"
                                } else {
                                    detikOutput = 4
                                    self.countDown = "\(detikOutput)"
                                    //getar(mode: "sukses")
                                    UINotificationFeedbackGenerator().notificationOccurred(.success)
                                }
                            } else {
                                detikOutput = 0
                                self.countDown = ""
                                self.timerDetik.upstream.connect().cancel()
                            }
                            TimerAtasDetik += 1
                        }
                        ).offset(y: UIScreen.main.bounds.height*0.1)
                    if count < penggandaInstruksi(jumlah: pengulangan, output: "subtitle").count - 1 {
                        SubtitleTemp(subtitle: penggandaInstruksi(jumlah: pengulangan, output: "subtitle")[count])
                            .offset(y: UIScreen.main.bounds.height*0.17)
                    }
                }
            }
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            if count < penggandaInstruksi(jumlah: pengulangan, output: "subtitle").count - 1 {
                ProgressView(value: buatProgress(atas: count, bawah: penggandaInstruksi(jumlah: pengulangan, output: "title").count))
                    .frame(width: UIScreen.main.bounds.width-30)
                    .padding()
                    .accentColor(Color(.systemBlue))
                
                NavigationLink(destination: EmotionPage()) {
                    buttonStyleTemplate(text: "Next")
                }.hidden()
            } else {
                NavigationLink(destination: BreathingPage()) {
                    buttonTemplate(funcActive: false, emotion: "Repeat Breathing")
                }
                .padding()
                .offset(y:UIScreen.main.bounds.width*0.1)
                NavigationLink(destination: EmotionPage()) {
                    buttonStyleTemplate(text: "Continue")
                }
                .offset(y:UIScreen.main.bounds.width*0.1)
            }
        }.offset(y:-UIScreen.main.bounds.width*0.15) 
    }
    func buatProgress(atas: Int, bawah: Int)-> Float {
        //var atasFloat = Float(atas)
        //atasFloat += 1
        //let bawahFloat = Float(bawah)
        //let hasil = atasFloat / bawahFloat
        let hasil:Float = Float(TimerAtasDetik)/Float(60)
        print(TimerAtasDetik)
        return Float(hasil)
    }
    
    func penggandaInstruksi(jumlah: Int, output: String)-> [String] {
        var berapa = 0
        var SubtitleOutput = [String]()
        var TitleOutput = [String]()
        let subtitleInput =  ["Inhale for 4 Seconds", "Hold for 4 Seconds", "Exhale for 4 Seconds","Hold for 4 Seconds"]
        let titleInput = ["Take a deep breath","Keep your breath","Release breath slowly", "Keep your breath"]
        if output == "subtitle" {
            SubtitleOutput.append("")
            while berapa < jumlah {
                SubtitleOutput.append(contentsOf: subtitleInput)
                berapa += 1
            }
            SubtitleOutput.removeLast()
            SubtitleOutput.append("Now that you are more focus,\nlet’s start imagining how your day went today.")
            return SubtitleOutput
        } else {
            TitleOutput.append("")
            while berapa < jumlah {
                TitleOutput.append(contentsOf: titleInput)
                berapa += 1
            }
            TitleOutput.removeLast()
            TitleOutput.append("Great Job!")
            return TitleOutput
        }
    }
    
    //    func getar(mode: String) {
    //        switch mode {
    //        case "sukses":
    //            let generator = UINotificationFeedbackGenerator()
    //            generator.notificationOccurred(.success)
    //        default:
    //            let generator = UINotificationFeedbackGenerator()
    //            generator.notificationOccurred(.success)
    //
    //        }
    //    }
}

struct BreathingPage_Previews: PreviewProvider {
    static var previews: some View {
        BreathingPage()
    }
}
