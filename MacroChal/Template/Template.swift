//
//  Template.swift
//  MacroChalTestUnit
//
//  Created by Andrew Novansky Ignatius on 20/10/20.
//

import SwiftUI
// Button Emoji untuk milih emotion
struct CircleImage: View {
    var imagename = "Sample"
    var body: some View {
        Image(imagename)
            .resizable()
            .clipShape(Circle())
    }
}

struct buttonEmoji: View {
    var emotionName = "Sample"
    var body: some View{
        
        VStack{
            Text(emotionName)
                .padding(3)
                .font(.body)
                .foregroundColor(.black)
            
            CircleImage(imagename: emotionName)
                .frame(width: 68, height: 68, alignment: .center)
        }
    }
}



//Button Segue yang dibawah
struct buttonStyleTemplate: View {
    var text = ""
    var body: some View{
        Text(text)
            .font(.body)
            .foregroundColor(Color("FontColor"))
            .frame(width: 374, height: 48)
            .background(Color("ActiveButtonColor"))
            .cornerRadius(20)
    }
}

struct reviewTemp: View {
    var emotionChoosen = ""
    var emotionDetails = "Grateful"
    var story = "I feel Grateful because . . ."
    var acceptenceText = "Because I know that I was angry because things didn’t go well but it was not my fault. It’s out of my control and I should learn to accept it that way."
    var heartOn = false
    var body: some View{
        VStack{
            Image(emotionChoosen)
                .padding()
            SubtitleTemp(subtitle: "I feel \(emotionDetails)")
            ScrollView{
                // hasil passing data
                SubtitleTemp(subtitle: story)
            }
            .frame(width: 354, height: 88, alignment: .center)
            .padding()
            .background(Color("TextfieldColor"))
            .cornerRadius(20)
            //button image toogle (Not Yet)
            if heartOn == true{
                Image("Heart.Fill")
                    .renderingMode(.none)
                    .font(.system(size: 62))
                    .padding()
                SubtitleTemp(subtitle: "I know it’s okay to feel that way")
            }else if heartOn == false{
                Image("Heart")
                    .renderingMode(.none)
                    .font(.system(size: 62))
                    .padding()
                SubtitleTemp(subtitle: "I’m not sure if that's okay ")
            }
            //hasil passing data
            
            
            ScrollView{
                SubtitleTemp(subtitle: acceptenceText)
            }
            .frame(width: 354, height: 135, alignment: .center)
            .padding()
            .background(Color("TextfieldColor"))
            .cornerRadius(20)
        }
    }
}

struct Template_Previews: PreviewProvider {
    @State private var activeIdx: Int = 0
    @State private var stringTest:String = ""
    static var previews: some View {
        VStack{
            TitleTemp(title: "Title")
            SubtitleTemp(subtitle: "This is template where we can put all our outlet template")
        }
        reviewTemp()
    }
}

//button untuk toggle
struct buttonEmotion: View {
    @State private var showDetails = false
    @State private var FuncActive = false
    @Binding var activeDetail: Int
    @Binding var selectedEmotion: String
    let idx: Int
    var emotion = "Error"
    var emotionDetails = "Feeling intense excitement and happiness"
    var body: some View {
        Button(action: {
            self.FuncActive.toggle()
            self.activeDetail = idx
            self.selectedEmotion = emotion
        }, label: {
            buttonTemplate(funcActive: activeDetail == idx, emotion: emotion)
        })
        showDetail(show: activeDetail == idx, emotionDetails: emotionDetails)
    }
}
struct showDetail: View{
    let show: Bool
    var emotionDetails:String
        var body: some View {
            if show{
            Text(emotionDetails)
                .font(.caption)
                .foregroundColor(.black)
        }
        }
}


struct buttonTemplate: View{
    var funcActive = false
    var emotion = "Error"
    var body: some View{
        if funcActive{
            Text(emotion)
                .font(.body)
                .foregroundColor(.black)
                .frame(width: 374, height: 48)
                .background(Color("ActiveButtonColor"))
                .cornerRadius(20)
        }else{
            Text(emotion)
                .font(.body)
                .foregroundColor(.black)
                .frame(width: 374, height: 48)
                .background(Color("WriteColor"))
                .cornerRadius(20)
        }
        
    }
}

