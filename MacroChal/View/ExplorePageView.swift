//
//  ExplorePageView.swift
//  Onboarding try
//
//  Created by Jenifer Yolanda on 19/10/20.
//

import SwiftUI

struct ExplorePageView: View {

    var body: some View{
        VStack() {
            Text("Coming Soon!").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title).offset(y: -50).foregroundColor(.accentColor).padding(10)
            
            Text("Boo can't wait to introduce you\("\n") to something special.").font(.body).offset(y: -50).foregroundColor(.accentColor).multilineTextAlignment(.center).padding(10)
            
            Image("BooComingSoon")
        }.offset(y: -120)
    }
    
    struct ExplorePageView_Previews: PreviewProvider {
        static var previews: some View {
            ExplorePageView()
        }
    }
}
