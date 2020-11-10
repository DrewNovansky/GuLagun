//
//  AcceptancePage.swift
//  MacroChalTestUnit
//
//  Created by Andrew Novansky Ignatius on 19/10/20.
//

import SwiftUI

struct AcceptancePage: View {
    @State private var heartState = false
    @State var acceptance = ""
    @State var showAlert = false
    @State var showView = false
    @State var keyboardState = false
    var emotionChoosen = ""
    var emotionDetails = "Grateful"
    var story = "test"
    
    var body: some View{
        ScrollView{
            VStack(){
                if keyboardState{
                    Text("")
                        .navigationBarItems(trailing:
                                                HStack{
                                                    Button(action: {
                                                        hideKeyboard()
                                                        keyboardState = false
                                                    }
                                                    , label: {
                                                        Text("Done")
                                                            .padding(5)
                                                    }
                                                    )
                                                })
                }
                else {
                    Text("")
                        .navigationBarItems(trailing:
                                                HStack{
                                                    Text("")
                                                })
                }
                VStack{
                    TitleTemp(title: "Do you know it’s okay \nto feel that way?")
                        .onTapGesture(perform: {
                            hideKeyboard()
                        })
                        .padding()
                    SubtitleTemp(subtitle: "“What you’ve felt is valid.\nThere’s no right or wrong feeling.\nIt is part of you & it’s okay to feel that way.”")
                        .onTapGesture(perform: {
                            hideKeyboard()
                        })
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    Button(action: {
                        self.heartState.toggle()
                    }, label: {
                        VStack(spacing: 5){
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
                    }).padding()
                    
                } .onTapGesture(perform: {
                    hideKeyboard()
                })
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                multilineTF(placeholder: "Because I ...",textWritten: $acceptance, keyboardState: $keyboardState)
                    .padding()
                VStack{
                    ProgressView(value: 0.8)
                        .frame(width: 374)
                        .accentColor(Color(.systemBlue))
                    NavigationLink(destination: QuotesPage(emotionChoosen: emotionChoosen, emotionDetails: emotionDetails, story: story, acceptenceText: acceptance, heartState: heartState), isActive: $showView){
                        Button(action: {
                            if acceptance == ""{
                                self.showAlert = true
                            }else if acceptance == "Because I ..."{
                                self.showAlert = true
                            }else if acceptance == "Because I "{
                                self.showAlert = true
                            }else{
                                showView = true
                            }
                        }, label: {buttonStyleTemplate(text: "Next")})
                    }.padding()
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Hello Friend"), message: Text("We would love to understand you better so tell us more about your story"), dismissButton: .cancel(Text("Sure!")))
                    }
                }.onTapGesture(perform: {
                    UIApplication.shared.endEditing()
                })
                
            }.offset(y:-UIScreen.main.bounds.height*0.1)
            
        }
    }
}

struct AcceptancePage_Previews: PreviewProvider {
    static var previews: some View {
        AcceptancePage()
    }
}
