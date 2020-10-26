//
//  BonFireView.swift
//  Onboarding try
//
//  Created by Jenifer Yolanda on 18/10/20.
//

import SwiftUI

struct BonFireView: View {
    @State private var showOnBoarding = false
    @AppStorage("OnboardBeenViewed") var hasOnboarded = false
    var body: some View {
        ZStack {
            BonFire()
            
            if showOnBoarding{
                ZStack{
                    Rectangle().fill(Color.white)
                    OnboardingPageView(isPresenting: $showOnBoarding)
                    
                }
            }
        }.onAppear{
            //hasOnboarded = false //testing only
            if !hasOnboarded{
                showOnBoarding.toggle()
                hasOnboarded = true
            }
        }
    }
}

struct BonFireView_Previews: PreviewProvider {
    static var previews: some View {
        BonFireView()
    }
}

struct BonFire : View{
   @State var isTopNavigationActive = false
    
    var body: some View{
        NavigationView{
            VStack{
                //image boo
                NavigationLink(
                    destination: AboutUsView(),
                    isActive: $isTopNavigationActive,
                    label: {}
                )
                
                Text("").navigationBarItems(trailing:
                    HStack{
                        Image("BooBtn").resizable().onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                            isTopNavigationActive = true
                        }).frame(width: 45, height: 45)
                    }
                )
                
                //image fire
                HStack{
                    VStack(alignment: .leading, spacing: 10) {
                        FireAnimation(imageName: "kayuBakar", x: 7, y: -75, width: 400, height: 320)
//                        Image("FireBG").renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: 450, height: 320, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                    }//.offset(y:-40)
                }
                
                //text
                VStack{
                    HStack{
                        Text("Welcome My Friend!")
                            .font(.title)
                            .multilineTextAlignment(.leading).foregroundColor(.accentColor)
                        Spacer()
                    }
                    HStack{
                        Text("Please make yourself comfortable")
                            .font(.body)
                            .multilineTextAlignment(.leading).foregroundColor(.accentColor)
                        Spacer()
                    }
                }.padding(5).offset(x : 25, y: -50)
                
                
                //buttons
                HStack{
                    //Express
                    NavigationLink(destination: ExpressPageView()){
                        ZStack {
                            Image("ExpressBtn").renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: 177, height: 257 , alignment: .center)
                            VStack{
                                Spacer()
                                Text("Express Yourself")
                                    .font(.title).foregroundColor(.accentColor).multilineTextAlignment(.center).padding(1)
                                
                                Text("How's Your day?").font(.body).foregroundColor(.accentColor)
                                
                            }.offset(y: -15)
                        }.frame(width: 177, height: 252).padding(5)
                    }
                    
                    //Explore
                    NavigationLink(destination: ExplorePageView()){
                        ZStack {
                            Image("ExploreBtn").renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: 177, height: 257 , alignment: .center)
                            VStack{
                                Spacer()
                                Text("Explore Yourself")
                                    .font(.title).foregroundColor(.accentColor).multilineTextAlignment(.center).padding(1)
                                
                                Text("Coming Soon").font(.body).foregroundColor(.accentColor)
                                
                            }.offset(y: -15)
                        }.frame(width: 177, height: 252).padding(5)
                    }
                }.offset(y: -45)
                //Quick Help
                NavigationLink(destination: QuickHelpView()){
                    HStack(spacing: 8){
                        Text("Quick Help!")
                            .font(.title3).fontWeight(.semibold).foregroundColor(.accentColor).multilineTextAlignment(.center).frame(width: 373, height: 81).padding(1).background(Color("BlueButton")).cornerRadius(30)
                    }.offset(y: -40)
                }
            }
        }
    }
}
