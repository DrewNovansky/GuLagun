//
//  HistoryPageView.swift
//  Onboarding try
//
//  Created by Jenifer Yolanda on 21/10/20.
//

import SwiftUI

struct HistoryPageView: View {
    var body: some View {
        
        VStack {
            Text("History")
            HStack{
                Text("Today,")
            }
            Text("Your writings that day:")
            
            ZStack {
                Image("HistoryBtn")
                HStack{
                    
                    Image("Emotion")
                    
                    VStack{
                        Text("tanggal")
                        Text("emosi")
                    }
                    
                    VStack{
                        Text("Jam")
                        Button(action: {}){
                            Image("Emotion")
                        }
                    }
                }
            }
        }
    }
}

struct HistoryPageView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryPageView()
    }
}

