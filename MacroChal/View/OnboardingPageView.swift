//
//  OnboardingPageView.swift
//  Onboarding try
//
//  Created by Jenifer Yolanda on 18/10/20.
//

import SwiftUI

struct OnboardingPageView: View {
   
    @Binding var isPresenting: Bool
    @State var developerNotes = false
    @State var selectedPage:Int = 0
    
    var body: some View {
        
        VStack {
            TabView(selection: $selectedPage ) {
                ForEach(0..<Data.count){ index in OnboardingCardView(onbardingCard: Data[index])
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
            Button(action: {developerNotes.toggle()}){
                HStack(spacing: 8){
                    Text("Next")
                        .font(.body).foregroundColor(.accentColor).frame(width: 374, height: 35).padding(5).background(Color("ButtonColor")).cornerRadius(30)
                }
            }.padding()
            .fullScreenCover(isPresented: $developerNotes) {
                
                DevPageView()
            }
        }.offset(y:-20)
        
    }
    
}

struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView(isPresenting: .constant(true))
    }
}
