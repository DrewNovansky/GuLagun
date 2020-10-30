//
//  WritingPage.swift
//  MacroChalTestUnit
//
//  Created by Andrew Novansky Ignatius on 19/10/20.
//

import SwiftUI

struct WritingPage: View {
    var emotionChoosen = "Love"
    var emotionDetails = "Grateful"
    @State var story = ""
    var body: some View {
        VStack{
            TitleTemp(title: "Why did you feel that way?")
            CircleImage(imagename: emotionChoosen)
                .frame(width: 68, height: 68)
                .padding()
            SubtitleTemp(subtitle: "“Write all you feel because all emotion is meant to be there. They all have their purpose.”").frame(width: 80)
            multilineTF(placeholder: "I feel \(emotionDetails) because",textWritten: $story)
            ProgressView(value: 0.6)
                .padding()
            NavigationLink(
                destination: AcceptancePage(acceptance: "", emotionChoosen: emotionChoosen, emotionDetails: emotionDetails, story: story),
                label: {
                    buttonStyleTemplate(text: "Next")
                }).padding(20)
        }.offset(y:-50)
    }
}

struct WritingPage_Previews: PreviewProvider {
    static var previews: some View {
        WritingPage()
    }
}
