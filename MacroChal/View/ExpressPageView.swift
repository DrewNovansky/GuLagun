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
                
                Image("ExpressPageImg").renderingMode(.original).resizable().aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * 0.6 , height:UIScreen.main.bounds.width * 0.5)
            }
            //text
            VStack{
                Text("Express")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center).foregroundColor(.accentColor).padding(3)
                
                Text("Have you imagined about your day?\nWhat’s on your mind?")
                    .font(.body)
                    .multilineTextAlignment(.center).foregroundColor(.accentColor)
                
            }.frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.25)
            
            //buttons
            VStack{
                //Express
                NavigationLink(destination:  FocusBreathingPage()){
                    
                    ZStack {
                        VStack{
                            Text("").frame(height:UIScreen.main.bounds.width * 0.04)
                            Image("WriteImg").renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: UIScreen.main.bounds.width * 0.8, alignment:.leading)
                        }
                        VStack(spacing: 10){
                            HStack(spacing:100) {
                                Text("")
                                Text("Begin Writing")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                            }
                            HStack(spacing:140) {
                                Text("")
                                Text("Start focus breathing\n& write your emotion\nin 7 minutes")
                                    .font(.body)
                                    .multilineTextAlignment(.leading)
                            }
                        }.foregroundColor(.accentColor).padding()
                        
                    }.frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.5).background(Color("WriteColor")).cornerRadius(20).padding(5)
                }
                
                //Explore
                NavigationLink(destination: HistoryNoCalendarTest()){
                    ZStack {
                        VStack{
                            Text("").frame(height:UIScreen.main.bounds.width * 0.04)
                            Image("ReadImg").renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: UIScreen.main.bounds.width * 0.8, alignment:.leading)
                        }
                        
                        VStack(spacing: 10){
                            HStack(spacing:110) {
                                Text("")
                                Text("Open Previous Writing")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                            }
                            HStack(spacing:140) {
                                Text("")
                                Text("Look back with a\ndifferent perspective")
                                    .font(.body)
                                    .multilineTextAlignment(.leading)
                            }
                        }.foregroundColor(.accentColor).padding()
                    }.frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.5).background(Color("GreenButton")).cornerRadius(20)
                }
            }.padding(1)
        }.offset(y: -UIScreen.main.bounds.height * 0.05)
    }
}

