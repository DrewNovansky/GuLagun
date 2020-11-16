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
    @State var keyboardState = false
    var body: some View {
        //dibikin masuk navbar dibikin hidden sesuai bool
        if keyboardState{
            Text("")
                .navigationBarItems(trailing:
                                        HStack
                                        {Button(action: {
                                            hideKeyboard()
                                            keyboardState = false
                                        }
                                        , label: {
                                            Text("Done")
                                                .padding(5)
                                            
                                        })
                                        })
        }
        else {
            Text("")
                .navigationBarItems(trailing:
                                        HStack{
                                            Text("")})
        }
        VStack{
            VStack{
                TitleTemp(title: "Why did you feel\nthat way?")
                    .onTapGesture(perform: {
                        hideKeyboard()
                        keyboardState = false
                    })
                CircleImage(imagename: emotionChoosen)
                    .frame(width: 68, height: 68).padding()
                    .onTapGesture(perform: {
                        hideKeyboard()
                        keyboardState = false
                    })
            }.offset(y: -UIScreen.main.bounds.height*0.05)
            ScrollView{
                SubtitleTemp(subtitle: "“Write all you feel because all emotion is meant to\nbe there. They all have their purpose.”")                .onTapGesture(perform: {
                    hideKeyboard()
                    keyboardState = false
                }) .onTapGesture(perform: {
                    hideKeyboard()
                    keyboardState = false
                })
                .padding()
                multilineTF(placeholder: "I feel \(emotionDetails) because",textWritten: $story, keyboardState: $keyboardState)
                    .padding(.bottom)
                    .ignoresSafeArea(.keyboard)
            }.frame(minHeight: UIScreen.main.bounds.height/3)
            VStack{
                ProgressView(value: 0.6)
                    .frame(width: UIScreen.main.bounds.width-30)
                    .accentColor(Color(.systemBlue))
                    .offset(y: UIScreen.main.bounds.height*0.01)
                    .padding(.bottom)
                    .onTapGesture(perform: {hideKeyboard()})
                NavigationLink(destination: AcceptancePage(acceptance: "", emotionChoosen: emotionChoosen, emotionDetails: emotionDetails, story: story), isActive: $showView){
                    Button(action: {
                        if story == "" || story == "I feel \(emotionDetails) because"{
                            self.showAlert = true
                        }else{
                            showView = true
                        }
                    }, label: {buttonStyleTemplate(text: "Next")})
                }
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Hello Friend"), message: Text("We would love to understand you better so tell us more about your story"), dismissButton: .cancel(Text("Sure")))
                }
            }
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
