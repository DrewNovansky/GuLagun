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
        NavigationView{
            VStack {
                TabView(selection: $selectedPage ) {
                    ForEach(0..<Data.count){ index in OnboardingCardView(onbardingCard: Data[index])
                    }
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
                NavigationLink(destination: BonFireView()) {
                    buttonStyleTemplate(text: "Next")
                }.padding()
                
            }
        }
    }
    
}

struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView(isPresenting: .constant(true))
    }
}
