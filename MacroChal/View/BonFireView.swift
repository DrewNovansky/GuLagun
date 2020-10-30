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
                        Text("Welcome!")
                            .font(.title).fontWeight(.semibold)
                            .multilineTextAlignment(.center
                            ).foregroundColor(.accentColor)
                        //Spacer()
                    }.padding(2)
                    HStack{
                        Text("Please make yourself comfortable")
                            .font(.body)
                            .multilineTextAlignment(.center).foregroundColor(.accentColor)
                       // Spacer()
                    }
                }.padding(1).offset(y: 20)
                
                //buttons
                VStack{
                    //Express
                    NavigationLink(destination: ExpressPageView()){
                        ZStack {
                            Image("ExpressBtn")
                            VStack{
                                Spacer()
                                Text("Express Yourself")
                                    .font(.title3).fontWeight(.semibold).foregroundColor(.accentColor).multilineTextAlignment(.center).padding(2).offset(x: 50, y: -40)
                                
                                Text("Calm your heart with focus breathing and write daily nores").font(.body).foregroundColor(.accentColor).offset(x: 55, y: -45).frame(width:170)
                                
                            }
                        }
                    }.padding(5)
                    //Explore
                    //NavigationLink(destination: ){//explorepage
                        ZStack {
                            Image("GrayEploreBtn")
                            
                            VStack{
                                Spacer()
                                Text("Explore inner you")
                                    .font(.title3).fontWeight(.semibold).foregroundColor(.accentColor).multilineTextAlignment(.center).padding(2).offset(x: 55, y: -15)
                                
                                Text("Answer questions to know more about yourself").font(.body).foregroundColor(.accentColor).offset(x: 75, y: -20).frame(width:200)
                            }
                        }
                }.offset(y: 20)
                //Quick Help
                    HStack(spacing: 8){
                        Text("If things get harder, we recommen you to get help through nearest psychologist")
                            .font(.footnote).foregroundColor(.accentColor).multilineTextAlignment(.center).frame(width: 373, height: 81).padding(1)
                    }
            }
        }.navigationBarHidden(true)
    }
}
