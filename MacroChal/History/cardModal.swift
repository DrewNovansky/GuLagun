//
//  cardModal.swift
//  MacroChalTestUnit
//
//  Created by Andrew Novansky Ignatius on 26/10/20.
//

import SwiftUI

struct cardModal: View {
    @State var heartState = false
    var body: some View {
        VStack{
            Spacer()
                .frame(height: 80)
            TitleTemp(title: "Hi There")
            SubtitleTemp(subtitle: "That day you didn’t choose to accept that feeling. Have you changed your mind?")
            Button(action: {
                self.heartState.toggle()
            }, label: {
                VStack(spacing: 20){
                    Text("Tap the heart if you do")
                        .foregroundColor(Color("FontColor"))
                    //button image toogle (Not Yet)
                    if heartState == true{
                    Image("Heart.Fill")
                        .renderingMode(.none)
                        .font(.system(size: 62))
                    }else if heartState == false{
                        Image("Heart")
                            .renderingMode(.none)
                            .font(.system(size: 62))
                    }
                }
            }).padding(5)
            Spacer()
        }
    }
}

struct cardModal_Previews: PreviewProvider {
    static var previews: some View {
        SlideOverCard { cardModal() }
    }
}

struct SlideOverCard<Content: View> : View {
    @State var position = CardPosition.top
    
    var content: () -> Content
    var body: some View {
        
        self.content()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.white)
            .cornerRadius(20.0)
            .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.13), radius: 10.0)
            .offset(y: self.position.rawValue + 400)
    }
}

enum CardPosition: CGFloat {
    case top = 100
    case middle = 500
    case bottom = 850
}
