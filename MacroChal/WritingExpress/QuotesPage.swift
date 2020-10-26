//
//  QuotesPage.swift
//  MacroChalTestUnit
//
//  Created by Andrew Novansky Ignatius on 20/10/20.
//

import SwiftUI

struct QuotesPage: View {
    var emotionChoosen = ""
    var emotionDetails = "Grateful"
    var story = ""
    var acceptenceText = ""
    var heartState = true
    
    var body: some View {
        
        VStack{
            TitleTemp(title: "That’s a great \nexperience today!")
            SubtitleTemp(subtitle: "Remember that there’s no right or wrong feeling. You should learn to embrace it as a part of your growth. Did you know that by accepting your feeling you are one step closer to love yourself more?")
            Image("Great!")
                .resizable()
                .frame(width: 286, height: 283, alignment: .center)
            SubtitleTemp(subtitle: "Let’s check out what you’ve written once more, shall we?")
            NavigationLink(
                destination: PreviewPage(),
                label: {
                    buttonStyleTemplate(text: "Next")
                })
        }
    }
}

struct QuotesPage_Previews: PreviewProvider {
    static var previews: some View {
        QuotesPage()
    }
}