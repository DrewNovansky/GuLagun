//
//  TextTemplate.swift
//  MacroChalTestUnit
//
//  Created by Andrew Novansky Ignatius on 22/10/20.
//

import SwiftUI
//TextStyle untuk Title yang gede
//TitleTemp(title: "")
//SubtitleTemp(subtitle: "")
//^ Copy untuk menggunakan

struct TitleTemp: View {
    
    var title = ""
    var body: some View{
        Text(title)
            .font(.title)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .foregroundColor(Color("FontColor"))
            .padding()
    }
}
struct SubtitleTemp: View {
    var subtitle = ""
    var body: some View{
        Text(subtitle)
            .font(.body)
            .multilineTextAlignment(.center)
            .foregroundColor(Color("FontColor"))
            .padding()
    }
}

struct TextTemplate_Previews: PreviewProvider {
    static var previews: some View {
        SubtitleTemp(subtitle: "TESTING")
    }
}
