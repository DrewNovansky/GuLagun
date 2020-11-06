//
//  WritingPage.swift
//  MacroChalTestUnit
//
//  Created by Andrew Novansky Ignatius on 19/10/20.
//

import SwiftUI

struct WritingPage: View {
    var emotionChoosen = "Love"
    var emotionDetails = "Grateful"
    @State var story = ""
    @State var showView = false
    @State var showAlert = false
    var body: some View {
        
        ScrollView{
            VStack{
                VStack{
                    TitleTemp(title: "Why did you feel that way?")
                        .onTapGesture(perform: {
                            hideKeyboard()
                        })
                    CircleImage(imagename: emotionChoosen)
                        .frame(width: 68, height: 68)
                        .onTapGesture(perform: {
                            hideKeyboard()
                        })
                    //.padding()
                    SubtitleTemp(subtitle: "“Write all you feel because all emotion is meant to be there. They all have their purpose.”")
                        .onTapGesture(perform: {
                            hideKeyboard()
                        })
                } .onTapGesture(perform: {
                    hideKeyboard()
                })
                multilineTF(placeholder: "I feel \(emotionDetails) because",textWritten: $story)
                ProgressView(value: 0.6)
                    .frame(width: 374)
                    .accentColor(Color(.systemBlue))
                    .onTapGesture(perform: {
                        hideKeyboard()
                    })
                
                NavigationLink(destination: AcceptancePage(acceptance: "", emotionChoosen: emotionChoosen, emotionDetails: emotionDetails, story: story), isActive: $showView){
                    Button(action: {
                        if story == ""{
                            self.showAlert = true
                        }else if story == "I feel \(emotionDetails) because"{
                            self.showAlert = true
                        }else{
                            showView = true
                        }
                    }, label: {buttonStyleTemplate(text: "Next")})
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Hello Friend"), message: Text("We would love to understand you better so tell us more about your story"), dismissButton: .cancel(Text("Sure")))
                    //MARK : Alert with option
                    //                     Alert(title: Text("Hello"), message: Text("Hai"), primaryButton: .cancel(Text("No")), secondaryButton: .destructive(Text("Yes"), action: {
                    //                        self.showView = true
                    //                    }))
                }
            }.offset(y:-50)
        }
    }
}

func hideKeyboard(){
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}

struct WritingPage_Previews: PreviewProvider {
    static var previews: some View {
        WritingPage()
    }
}
