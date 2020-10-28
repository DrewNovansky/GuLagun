//
//  ExpressPageView.swift
//  Onboarding try
//
//  Created by Jenifer Yolanda on 19/10/20.
//

import SwiftUI

struct ExpressPageView: View {
    var body: some View {
        ExpressPage()
    }
}

struct ExpressPageView_Previews: PreviewProvider {
    static var previews: some View {
        ExpressPageView()
    }
}

struct ExpressPage : View{
    
    var body: some View{
        VStack {
            
            VStack() {
                
                Image("ExpressPageImg").renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: 252, height: 165, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding(3)//.offset(y:30)
            }
            //text
            VStack{
                HStack{
                    Text("Express")
                        .font(.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center).foregroundColor(.accentColor)//.padding()
                }
                VStack{
                    Text("Have you imagined about your day?")
                        .font(.body)
                        .multilineTextAlignment(.center).foregroundColor(.accentColor)
                    
                    Text("What’s on your mind?")
                        .font(.body)
                        .multilineTextAlignment(.center).foregroundColor(.accentColor)
                }
            }.padding(3)
            
            //buttons
            VStack{
                //Express
                NavigationLink(destination:  FocusBreathingPage()){//nanti ganti ke breathing ini buat testing dulu
                   
                    ZStack {
                        Image("WriteImg").renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: 372, alignment:.leading)
                        VStack{
                            Spacer()
                            Text("Begin Writing")
                                .font(.title3).fontWeight(.semibold).foregroundColor(.accentColor).multilineTextAlignment(.center).padding(2).offset(x: 60, y: -50)
                            
                            Text("Start focus breathing & write your emotion in 7 minutes").font(.body).foregroundColor(.accentColor).offset(x: 70, y: -50).frame(width:170)
                            
                        }
                    }.frame(width: 374, height: 198).padding(5).background(Color("WriteColor")).cornerRadius(30)
                }.padding()
                
                //Explore
                NavigationLink(destination: HistoryNoCalendarTest()){
                    ZStack {
                        Image("ReadImg").renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: 372, alignment:.leading)
                        VStack{
                            Spacer()
                            Text("Open Previous Writing")
                                .font(.title3).fontWeight(.semibold).foregroundColor(.accentColor).multilineTextAlignment(.center).padding(1).offset(x: 60, y: -50)
                            
                            Text("Look back with a different perspective").font(.body).foregroundColor(.accentColor).offset(x: 70, y: -50).frame(width: 195)
                            
                        }
                    }.frame(width: 374, height: 198).padding(5).background(Color("GreenButton")).cornerRadius(30)
                }
            }
        }.offset(y: -30)
    }
}

