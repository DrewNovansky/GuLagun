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
            //            hasOnboarded = false //testing only
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
                VStack{
                    VStack{
                        FireAnimation(imageName: "kayuBakar", x: 20, y: -75, width: Int(UIScreen.main.bounds.width * 0.9), height: Int(UIScreen.main.bounds.width * 0.8))
                    }
                    //text
                    VStack{
                        HStack{
                            Text("Welcome!")
                                .font(.title).fontWeight(.semibold)
                                .multilineTextAlignment(.center
                                ).foregroundColor(.accentColor)
                            
                        }.padding(3)
                        HStack{
                            Text("Please make yourself comfortable")
                                .font(.body)
                                .multilineTextAlignment(.center).foregroundColor(.accentColor)
                            
                        }
                    }.padding(5)
                }
                //buttons
                VStack{
                    //Express
                    NavigationLink(destination: ExpressPageView()){
                        HStack {
                            Image("ExpressBtnImg")
                                .resizable().frame(width: UIScreen.main.bounds.width * 0.27 , height:UIScreen.main.bounds.width * 0.25 ).padding()
                            
                            VStack(spacing: 3){
                                HStack{
                                    Text("Express Yourself")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                }
                                HStack{
                                    Text("Calm your heart with\nfocus breathing and\nwrite daily notes")
                                        .font(.body)
                                        .multilineTextAlignment(.leading)
                                }
                            }.foregroundColor(.accentColor).padding()
                            
                        }.frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.4).background(Color("ActiveButtonColor")).cornerRadius(20).padding(3)
                    }
                    //Explore
                    //NavigationLink(destination: ){//explorepage
                    HStack {
                        Image("GrayExploreBtnImg").resizable().frame(width: UIScreen.main.bounds.width * 0.28 , height:UIScreen.main.bounds.width * 0.19 ).padding()
                        
                        VStack(spacing: 3){
                            HStack {
                                Text("Explore Inner You")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                            }
                            HStack {
                                Text("Answer questions to\nknow more about you")
                                    .font(.body)
                                    .multilineTextAlignment(.leading)
                            }
                        }.foregroundColor(.accentColor).padding()
                        
                    }.frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.3).background(Color("GrayBtn")).cornerRadius(20).padding(3)
                }
                //Quick Help
                HStack{
                    Text("If things get harder, we recommend you to get help through the nearest psychologist")
                        .font(.footnote).foregroundColor(.accentColor).multilineTextAlignment(.center).frame(width: UIScreen.main.bounds.width * 0.9).padding(5)
                }
            }
        }.navigationBarHidden(true)
    }
}
