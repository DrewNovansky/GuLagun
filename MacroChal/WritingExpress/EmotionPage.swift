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
                TitleTemp(title: "How did you feel today?")
                SubtitleTemp(subtitle: "Choose which one is your most dominant\nfeeling today using this Feeling Wheel\ninspired from The Junto Wheel.")
                    .frame(width: 80)
                ZStack{
                    Circle()
                        .frame(width: 286, height: 283)
                        .foregroundColor(Color("WriteColor"))
                    
                    VStack{
                        NavigationLink(
                            destination: Emotion2Page(emotionChoosen: "Joy"),
                            label: {
                                buttonEmoji(emotionName: "Joy")
                            }).padding(10)
                            .offset(y: 30)
                        
                        HStack{
                            NavigationLink(
                                destination: Emotion2Page(emotionChoosen: "Fear"),
                                label: {
                                    buttonEmoji(emotionName: "Fear")
                                }).padding(10)
                            Spacer()
                                .frame(width: 130)
                            NavigationLink(
                                destination: Emotion2Page(emotionChoosen: "Love"),
                                label: {
                                    buttonEmoji(emotionName: "Love")
                                }).padding(10)
                        }.offset(y: -30.0)
                        
                        HStack{
                            NavigationLink(
                                destination: Emotion2Page(emotionChoosen: "Surprise", emotionDetails: ""),
                                label: {
                                    buttonEmoji(emotionName: "Surprise")
                                }).padding(10)
                            Spacer()
                                .frame(width: 130)
                            NavigationLink(
                                destination: Emotion2Page(emotionChoosen: "Sad"),
                                label: {
                                    buttonEmoji(emotionName: "Sad")
                                }).padding(10)
                        }.offset(y: -30.0)
                        
                        NavigationLink(
                            
                            destination: Emotion2Page(emotionChoosen: "Anger"),
                            label: {
                                buttonEmoji(emotionName: "Anger")
                            }).padding(10)
                            .offset(y: -70)
                    }
                }
                ProgressView(value: 0.2)
                    .padding()
                    .offset(y: -20)
            }.offset(y:-50)
    }
}



struct ChooseEmotion_Previews: PreviewProvider {
    static var previews: some View {
        EmotionPage()
    }
}
