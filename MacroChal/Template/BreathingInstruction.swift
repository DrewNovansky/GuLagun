//
//  BreathingInstruction.swift
//  MacroChal
//
//  Created by Steven Rafaelie on 23/10/20.
//

import SwiftUI

struct BreathingInstruction: View {
    
    var imageName: String
    var instruction: String
    
    var body: some View {
        
        HStack{
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40,alignment: .leading)
                .padding()
            Text(instruction)
                .font(.body)
                .foregroundColor(Color("FontColor"))
                .padding()
                .frame(width:200, height:40 , alignment: .leading)
        }.frame(width: 300, height: 50)
    }
}

struct BreathingInstruction_Previews: PreviewProvider {
    static var previews: some View {
        BreathingInstruction(imageName: "HeartFilled", instruction: "Inhale for 4 seconds")
    }
}
