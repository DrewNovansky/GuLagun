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
                .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.width*0.2)
            
            SubtitleTemp(subtitle: "Remember that there’s no right or wrong feeling.\nYou should embrace it as a part of your growth.\nDid you know that by accepting your feeling\nyou are one step closer to love yourself more?")
                .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.1)
                .padding()
            
            
            Image("Great!")
                .resizable()
                .frame(width: 286, height: 283, alignment: .center)
                .padding()
            
            
            SubtitleTemp(subtitle: "Let’s check out what you’ve written once more,\nshall we?")
                .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.width*0.2)
                .padding()
            
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            ProgressView(value: 1.0)
                .frame(width: 374)
                .accentColor(Color(.systemBlue))
                .padding()
            
            NavigationLink(
                destination: PreviewPage(emotionChoosen: emotionChoosen, emotionDetails: emotionDetails, story: story, acceptenceText: acceptenceText, heartOn: heartState),
                label: {
                    buttonStyleTemplate(text: "Next")
                })
                .padding()
            
        }.offset(y:-UIScreen.main.bounds.height*0.04)
    }
}

struct QuotesPage_Previews: PreviewProvider {
    static var previews: some View {
        QuotesPage()
    }
}
