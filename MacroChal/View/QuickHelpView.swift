//
//  QuickHelpView.swift
//  Onboarding try
//
//  Created by Jenifer Yolanda on 19/10/20.
//

import SwiftUI

struct QuickHelpView: View {
    var body: some View {
    ScrollView{
        VStack{
            Text("Quick Help!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("AccentColor"))
            
                VStack(alignment:.leading){
                    Text("\("\n")We are not a team of professionals but we are guided by the professionals. If things get harder, we recommend you to get help through\("\n")\("\n")Your closest friends\("\n")Your supportive family member\("\n")Nearest psychologist such as \("\n")")
                    
                    Text("Clinical Psychologist\("\n")Transpersonal psychology and adolescents:").fontWeight(.bold)
                    
                    Text("Fiona Valentina Damanik, M.Psi.\("\n")Instagram: @fionadamanik\("\n")")
                    
                    Text("Leadership").fontWeight(.bold)
                    
                    Text("Marcell Valentino, S.Pd.\("\n")Instagram: @marcellvalentino\("\n")\("\n")or\("\n")")
                    
                    Text("Into the Light Indonesia").fontWeight(.bold)
                    
                    Text("Indonesian Youth community\("\n")")
                    
                    Text("119").fontWeight(.bold)
                    
                    Text("24 Hour Emergency Services in Indonesia\("\n")")
                    
                    /*Text("National Mental Health Commission").fontWeight(.bold)
                     
                     Text("24 Hour Emergency Services in Australia\("\n")")
                     
                     Text("spur: Mental health support").fontWeight(.bold)
                     
                     Text("Links to various crisis counselling services and information networks around the world.\("\n")")
                     
                     Text(" Befrienders Worldwide").fontWeight(.bold)
                     
                     Text("Volunteer action to prevent suicide")
                     
                     Text("NHS mental health helplines").fontWeight(.bold)
                     
                     Text("Helplines in the UK")
                     
                     Text(" Mental Health Hotline Numbers and Referral").fontWeight(.bold)
                     
                     Text("Resources:Helplines in the US*")*/
                    
                    
                }.font(.body)
                .foregroundColor(Color("AccentColor"))
                
            }.frame(width: 380, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Image("EmergencyHelpImg").resizable().aspectRatio(contentMode: .fit).frame(width: 420, height: 350)
        }.offset(y: -3)
    }
}

struct QuickHelpView_Previews: PreviewProvider {
    static var previews: some View {
        QuickHelpView()
    }
}

