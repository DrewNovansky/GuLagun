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
                VStack{
                TitleTemp(title: "Do you know it’s okay \nto feel that way?")
                SubtitleTemp(subtitle: "“What you’ve felt is valid.\nThere’s no right or wrong feeling.\nIt is part of you & it’s okay to feel that way.”").frame(width: 80)
                Button(action: {
                    self.heartState.toggle()
                }, label: {
                    VStack(spacing: 5){
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
                }.onTapGesture(perform: {
                    UIApplication.shared.endEditing()
                })
                multilineTF(placeholder: "Because I ...",textWritten: $acceptance)
                VStack{
                ProgressView(value: 0.8)
                    .padding()
                NavigationLink(
                    destination: QuotesPage(emotionChoosen: emotionChoosen, emotionDetails: emotionDetails, story: story, acceptenceText: acceptance, heartState: heartState),
                    label: {
                        buttonStyleTemplate(text: "Next")
                    }).padding()
                }.onTapGesture(perform: {
                    UIApplication.shared.endEditing()
                })
                
            }
            .offset(x: 0, y: -60)
            
        }
    }
}

struct AcceptancePage_Previews: PreviewProvider {
    static var previews: some View {
        AcceptancePage()
    }
}
