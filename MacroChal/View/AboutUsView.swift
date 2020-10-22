//
//  AboutUsView.swift
//  Onboarding try
//
//  Created by Jenifer Yolanda on 19/10/20.
//

import SwiftUI

struct AboutUsView: View {
    var body: some View {
        VStack{
            Text("About Us")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("AccentColor")).padding().offset(y:-20)
            
            Text("ForNow presents ForRest")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(Color("AccentColor"))
                .multilineTextAlignment(.center).padding(10).offset(y:-20)
            
            Text("Our team consists of")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(Color("AccentColor"))
                .multilineTextAlignment(.center).padding(5)
            
            VStack{
                Text("Andrew Novansky")
                Text("Jenifer Yolanda")
                Text("Olivia Krisdy")
                Text("Steven Rafaelie")
                Text("Vania Hefira")
            }.font(.body)
            .foregroundColor(Color("AccentColor")).padding()
            
            Text("Special thanks to")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(Color("AccentColor"))
                .multilineTextAlignment(.center).padding(5)
            
            VStack{
                Text("David Gunawan, S.Kom.")
                Text("Phil Wira, B.Arch.")
                Text("as our mentors")
            }.font(.body)
            .foregroundColor(Color("AccentColor")).padding()
            
            VStack{
                Text("Fiona Damanik, S.Psi.")   .font(.body)
                    .foregroundColor(Color("AccentColor"))
                Text("Marcell Valentino, S.Pd.")   .font(.body)
                    .foregroundColor(Color("AccentColor"))
                Text("Tumbur Silalahi, S.Psi.")   .font(.body)
                    .foregroundColor(Color("AccentColor"))
                Text("Annisa Dwi Rachmawati, M.Psi.")   .font(.body)
                    .foregroundColor(Color("AccentColor"))
                Text("as our source people")   .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color("AccentColor"))
            }.padding()
            
            
            Image("AboutUsImg").resizable().aspectRatio(contentMode: .fit).offset(y: 0)
        }.offset(y: -30)
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
