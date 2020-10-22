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
        VStack(){
            Image("DevNote").resizable().aspectRatio(contentMode: .fit).frame(width: 350, height: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding()
            
            Text("Developers").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).multilineTextAlignment(.center)
            
            Text("note").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).multilineTextAlignment(.center)
            
            Text("  We care about your privacy and safety.We never collect any text you enter.Your text is stored securely in your personal iCloud, not with us.").font(.body).multilineTextAlignment(.center).padding(10)
            
            Button(action: {}){
                HStack(spacing: 8){
                    Text("Privacy Policy")
                        .font(.body).foregroundColor(.blue).frame(width: 374, height: 35).padding(0).offset(y: 20)
                }
            }
            
            Button(action: {}){
                HStack(spacing: 8){
                    Text("Term of Use")
                        .font(.body).foregroundColor(.blue).frame(width: 374, height: 35).padding(0).offset(y: 30)
                }
            }
            
            Button(action: {bonFire.toggle()}){
                VStack{
                    Spacer()
                    HStack(spacing: 8){
                        
                        Text("Start")
                            .font(.body).foregroundColor(.accentColor).frame(width: 374, height: 35).padding(5).background(Color("ButtonColor")).cornerRadius(30)
                    }
                }
            }.fullScreenCover(isPresented: $bonFire) {
                
                BonFireView()
            }
            
        }.padding()
        
    }
    
    struct DevPageView_Previews: PreviewProvider {
        static var previews: some View {
            DevPageView()
        }
    }
}

