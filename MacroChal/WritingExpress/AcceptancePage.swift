//
//  AcceptancePage.swift
//  MacroChalTestUnit
//
//  Created by Andrew Novansky Ignatius on 19/10/20.
//

import SwiftUI

struct AcceptancePage: View {
    @State private var heartState = false
    @State var acceptance = ""
    var emotionChoosen = ""
    var emotionDetails = "Grateful"
    var story = "test"
    var body: some View{
        ScrollView{
            VStack(){
                TitleTemp(title: "Do you know it’s okay \nto feel that way?")
                SubtitleTemp(subtitle: "“What you’ve felt is valid. There’s no right or wrong feeling. It is part of you & it’s okay to feel that way.”")
                Button(action: {
                    self.heartState.toggle()
                }, label: {
                    VStack(spacing: 20){
                        Text("Tap the heart if you do")
                            .foregroundColor(Color("FontColor"))
                        //button image toogle (Not Yet)
                        if heartState == true{
                        Image("Heart.Fill")
                            .renderingMode(.none)
                            .font(.system(size: 62))
                        }else if heartState == false{
                            Image("Heart")
                                .renderingMode(.none)
                                .font(.system(size: 62))
                        }
                    }
                }).padding()
                multilineTF(placeholder: "Because I ...",textWritten: $acceptance)
                NavigationLink(
                    destination: QuotesPage(emotionChoosen: emotionChoosen, emotionDetails: emotionDetails, story: story, acceptenceText: acceptance, heartState: heartState),
                    label: {
                        buttonStyleTemplate(text: "Next")
                    }).padding()
            }
        }
    }
}

struct AcceptancePage_Previews: PreviewProvider {
    static var previews: some View {
        AcceptancePage()
    }
}
