//
//  ChooseEmotion.swift
//  MacroChalTestUnit
//
//  Created by Andrew Novansky Ignatius on 19/10/20.
//

import SwiftUI

struct EmotionPage: View {
    var body: some View {
        VStack{
            TitleTemp(title: "How did you\nfeel today?")
            SubtitleTemp(subtitle: "Choose which one is your most dominant\nfeeling today using this Feeling Wheel\ninspired from The Junto Wheel.").padding()
             
            ZStack{
                Circle()
                    .frame(width: 286, height: 283)
                    .foregroundColor(Color("WriteColor"))
                
                VStack{
                    NavigationLink(
                        destination: Emotion2Page(emotionChoosen: "Joy", emotionDetails: "Euphoric", activeIdx: 0),
                        label: {
                            buttonEmoji(emotionName: "Joy")
                        }).padding(10)
                        .offset(y:UIScreen.main.bounds.width*0.1)
                    
                    HStack{
                        NavigationLink(
                            destination: Emotion2Page(emotionChoosen: "Fear", emotionDetails: "Scared", activeIdx: 0),
                            label: {
                                buttonEmoji(emotionName: "Fear")
                            }).padding(10)
                        Spacer()
                            .frame(width: 130)
                        NavigationLink(
                            destination: Emotion2Page(emotionChoosen: "Love", emotionDetails: "Grateful", activeIdx: 0),
                            label: {
                                buttonEmoji(emotionName: "Love")
                            }).padding(10)
                    }.offset(y:-UIScreen.main.bounds.width*0.037)
                    
                    HStack{
                        NavigationLink(
                            destination: Emotion2Page(emotionChoosen: "Surprise", emotionDetails: "Moved", activeIdx: 0),
                            label: {
                                buttonEmoji(emotionName: "Surprise")
                            }).padding(10)
                        Spacer()
                            .frame(width: 130)
                        NavigationLink(
                            destination: Emotion2Page(emotionChoosen: "Sad", emotionDetails: "Gloomy", activeIdx: 0),
                            label: {
                                buttonEmoji(emotionName: "Sad")
                            }).padding(10)
                    }.offset(y:-UIScreen.main.bounds.width*0.037)
                    
                    NavigationLink(
                        
                        destination: Emotion2Page(emotionChoosen: "Anger", emotionDetails: "Enraged", activeIdx: 0),
                        label: {
                            buttonEmoji(emotionName: "Anger")
                        }).padding(10)
                        .offset(y:-UIScreen.main.bounds.width*0.20)
                  
                }
            }
            .offset(y:-UIScreen.main.bounds.width*0.1)
            
            Spacer(minLength: 0)
            
            ProgressView(value: 0.2)
                .offset(y:-UIScreen.main.bounds.width*0.15)
                .frame(width: 374)
                .accentColor(Color(.systemBlue))
        }.offset(y:-UIScreen.main.bounds.height*0.05)
    }
}



struct ChooseEmotion_Previews: PreviewProvider {
    static var previews: some View {
        EmotionPage()
    }
}
