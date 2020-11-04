//
//  OnboardingCardView.swift
//  Onboarding try
//
//  Created by Jenifer Yolanda on 17/10/20.
//

import SwiftUI

struct OnboardingCardView: View {
    
    var onbardingCard:OnboardingCard
    
    var body: some View {
        VStack{
            
            Image(onbardingCard.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350, height: 350, alignment: .center)
            Text(onbardingCard.title)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
                .foregroundColor(.accentColor)
            Text(onbardingCard.subtitle)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
                .foregroundColor(.accentColor)
            Text(onbardingCard.text).multilineTextAlignment(.center).font(.body).foregroundColor(.accentColor).padding()
            
        }.offset(y: -50)
    }
    
    struct OnboardingCardIView_Previews: PreviewProvider {
        static var previews: some View {
            OnboardingCardView(onbardingCard: Data[0])
        }
    }
}
