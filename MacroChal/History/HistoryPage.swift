//
//  HistoryPage.swift
//  MacroChalTestUnit
//
//  Created by Andrew Novansky Ignatius on 21/10/20.
//

import SwiftUI

struct HistoryPage: View {
    var body: some View {
        ScrollView{
            VStack{
//                ScrollView{
                TitleTemp(title: "#Tanggal#")
                SubtitleTemp(subtitle: "#Jam#")
                    reviewTemp(emotionChoosen: "Love")
                SubtitleTemp(subtitle: "Note to self:")
                ScrollView{
                    SubtitleTemp(subtitle: "#Tanggal#")
                    SubtitleTemp(subtitle: "Because I know that I was angry because things didn’t go well but it was not my fault. It’s out of my control and I should learn to accept it that way.")
                }
                .frame(width: 354, height: 135, alignment: .center)
                .padding()
                .background(Color("CommentColor"))
                .cornerRadius(20)
                NavigationLink(
                    destination: WayToGoPage(),
                    label: {
                        buttonStyleTemplate(text: "Write your note")
                    })
            }
        }
    }
}

struct HistoryPage_Previews: PreviewProvider {
    static var previews: some View {
        HistoryPage()
    }
}
