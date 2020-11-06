//
//  DevPageView.swift
//  Onboarding try
//
//  Created by Jenifer Yolanda on 18/10/20.
//

import SwiftUI

struct DevPageView: View {
    
    @State var bonFire = false
    
    var body: some View {
      
            VStack(alignment: .center, spacing: 20){
                Image("DevNote")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350)
                Text("Developers \n notes").font(.title/*@END_MENU_TOKEN@*/).fontWeight(/*@START_MENU_TOKEN@*/.bold).multilineTextAlignment(.center).foregroundColor(.accentColor)
                
                Text("We care about your privacy and safety.\nWe never collect any text you enter.\nYour text is stored securely in your personal iCloud, not with us.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.accentColor)
                
                NavigationLink(
                    destination: DisclaimerView(),
                    label: {
                        Text("Terms and conditions")
                            .font(.body)
                            .foregroundColor(.blue)
                            .frame(width: 374, height: 35)
                    })
                NavigationLink(
                    destination: BonFireView(),
                    label: {
                        Text("Start")
                            .font(.body).foregroundColor(.accentColor).frame(width: 374, height: 48).padding(5).background(Color("ButtonColor")).cornerRadius(20)
                    })
                Spacer()
            
        }.navigationBarHidden(true)
    }
}

struct DevPageView_Previews: PreviewProvider {
    static var previews: some View {
        DevPageView()
    }
}


