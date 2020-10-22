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
    var body: some View {
        VStack{
            TitleTemp(title: "Why did you feel \nthat way?")
            CircleImage(imagename: emotionChoosen)
                .frame(width: 68, height: 68)
                .padding()
            SubtitleTemp(subtitle: "“Write all you feel because all emotion is meant to be there. They all have their purpose.”")
            multilineTF(placeholder: "I feel \(emotionDetails) because")
            NavigationLink(
                destination: AcceptancePage(emotionChoosen: emotionChoosen, emotionDetails: emotionDetails,story: "Testing dulu"),
                label: {
                    buttonStyleTemplate(text: "Next")
                })
            
            
        }
    }
}

struct WritingPage_Previews: PreviewProvider {
    static var previews: some View {
        WritingPage()
    }
}
