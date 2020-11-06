//
//  OnboardingCard.swift
//  Onboarding try
//
//  Created by Jenifer Yolanda on 17/10/20.
//

import Foundation

struct OnboardingCard: Identifiable{
    var id = UUID()
    var image: String
    var title: String
    var subtitle: String
    var text: String
    
}

var Data:[OnboardingCard] = [
    OnboardingCard(image: "OnboardingForRest", title: "Welcome to", subtitle: "ForRest!", text: "This is a safe place where you can learn to love yourself more by deepening your connection with yourselves. With ForRest, you are guided to do self-dialogue, to come back to your inner state which is: calm, safe and comfy."),
    OnboardingCard(image: "OnboardingBoo", title: "My name is", subtitle: "BOO", text: "You are not alone in the ForRest, I am here as your personal spirit guide. I will help you to go through this journey to know more about yourself.\nThe fire is my power source.\nSo let's keep the fire going."),
    OnboardingCard(image: "DevNote", title: "Developers", subtitle: "notes", text: "We care about your privacy and safety.\nWe never collect any text you enter.\nYour text is stored securely in your personal iCloud, not with us."),
]
