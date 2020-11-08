//
//  AboutUsView.swift
//  Onboarding try
//
//  Created by Jenifer Yolanda on 19/10/20.
//

import SwiftUI

struct AboutUsView: View {
    var body: some View {
        ScrollView(showsIndicators: false){
            
            VStack {
                
                VStack(alignment: .center){
                    
                    Text("About Us\n")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Boo presents ForRest \n\n Our team consists of\n")
                        .font(.body)
                        .fontWeight(.bold)
                    
                    
                    Text("Andrew Novansky \nJenifer Yolanda\nOlivia Krisdy \nSteven Rafaelie \nVania Hefira\n").font(.body)
                    
                    Text("Special thanks to\n")
                        .font(.body)
                        .fontWeight(.bold)
                    
                    Text("David Gunawan, S.Kom. \nPhil Wira, B.Arch. \nas our mentors\n\nFiona Damanik, M.Psi. \nMarcell Valentino, S.Pd. \nTumbur Silalahi, S.Psi. \nAnnisa Dwi Rachmawati, M.Psi. \nas our experts")
                        .font(.body)
                }
                .multilineTextAlignment(.center)
                .foregroundColor(.accentColor)
                
                Image("AboutUsImg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
