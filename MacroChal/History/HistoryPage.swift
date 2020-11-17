//
//  HistoryPage.swift
//  MacroChalTestUnit
//
//  Created by Andrew Novansky Ignatius on 21/10/20.
//

import SwiftUI
import CoreData

struct HistoryPage: View {
    var emotionChoosen = ""
    var emotionDetails = "Grateful"
    @State var story = ""
    @State var acceptenceText = ""
    @State var heartOn:Bool
    var tanggal: String
    var jam: String
    @State var datayangmana: DiaryDatabase
    @State var editOn = true
    @Environment(\.managedObjectContext) private var viewContext
    @State var buttonComment = true
    @State var commentField = false
    @State var halfModal = false
    @State var commentText = ""
    @State var keyboardState = false
    @State var showAlert = false
    @State var adaKomen = false
    
    @FetchRequest(entity: CommentaryData.entity(), sortDescriptors: [NSSortDescriptor(key: "timestampComment", ascending: true)]) var commentTest : FetchedResults<CommentaryData>
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
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
                    TitleTemp(title: "\(tanggal)")
                    SubtitleTemp(subtitle: "\(jam)")
                    reviewTemp(emotionChoosen: emotionChoosen, emotionDetails: emotionDetails, story: story, acceptenceText: acceptenceText, heartOn: heartOn)
                    
                    if adaKomen {
                        SubtitleTemp(subtitle: "Note to self:")
                            .padding(.top, 12)
                    } 
                    
                    //ini untuk scroll view nya munculin
                    
                    ForEach(self.commentTest) { isiKomen in
                        if isiKomen.children == datayangmana {
                            //                            self.adaKomen = true
                            ScrollView{
                                SubtitleTemp(subtitle:
                                                outputTanggalKomen(inputTanggal: isiKomen.timestampComment)
                                ).padding(.top)
                                SubtitleTemp(subtitle: isiKomen.comment)
                                    .onAppear(perform: {
                                        adaKomen = true
                                    })
                            }
                            .frame(width: UIScreen.main.bounds.width*0.9, height: 135, alignment: .center)
                            .background(Color("CommentColor"))
                            .cornerRadius(20)
                            .padding()
                        }
                    }
                    if commentField{
                        multilineTF(placeholder: "Write Here...", textWritten: $commentText, keyboardState: $keyboardState)
                            .padding()
                    }
                    Button(action: {
                        if buttonComment{
                            commentField.toggle()
                            buttonComment.toggle()
                        } else if buttonComment == false{
                            if commentText == "" ||  commentText == "Write Here..." || commentText == "Write Here"{ 
                                self.showAlert = true }
                            else{
                                saveComment()
                                if heartOn == false
                                { halfModal.toggle()}
                                commentField.toggle()
                                buttonComment.toggle()
                            }
                        }
                    }, label: {
                        if buttonComment{
                            buttonStyleTemplate(text: "Add Note")
                                .padding()
                        } else if buttonComment == false{
                            buttonStyleTemplate(text: "Save Note")
                                .padding()
                            
                        }
                    }).alert(isPresented: $showAlert) {
                        Alert(title: Text("Hello Friend"), message: Text("We would love to understand you better so tell us more about your story"), dismissButton: .cancel(Text("Sure")))
                    }
                }.offset(y:UIScreen.main.bounds.height*0.01)
            }.offset(y:-UIScreen.main.bounds.height*0.011)
            if halfModal {
                VStack{
                    SlideOverCard {
                        cardModal(heartState: $heartOn)
                    }
                    Button(action:{
                        halfModal.toggle()
                        reloadHeart()
                    },label: {
                        buttonStyleTemplate(text: "Save")
                    })
                    .offset(y: -UIScreen.main.bounds.height/10)
                }
            }
        }
    }
    
    func saveComment() {
        let diary = CommentaryData(context: viewContext)
        diary.children = datayangmana
        diary.comment = commentText
        diary.timestampComment = Date()
        //Save context
        do {
            try viewContext.save()
            print("Saved")
        } catch {
            let error = NSError.self
            fatalError("UnresolvedError \(error)")
        }
    }
    func reloadHeart() {
        datayangmana.heartOn = heartOn
        do {
            try viewContext.save()
            print("Saved")
        } catch {
            let error = NSError.self
            fatalError("UnresolvedError \(error)")
        }
    }
    func outputTanggalKomen(inputTanggal: Date)-> String {
        let ubahTanggal = DateFormatter()
        var tanggalString: String = String()
        ubahTanggal.dateFormat = "d MMM y"
        tanggalString = ubahTanggal.string(from: inputTanggal)
        return tanggalString
    }
}

struct HistoryPage_Previews: PreviewProvider {
    static var previews: some View {
        HistoryPage(emotionChoosen: "Joy", emotionDetails: "Grateful", story: "", acceptenceText: "", heartOn: false,tanggal: "",jam:"", datayangmana: DiaryDatabase(), buttonComment: true, commentField: false, halfModal: false, commentText: "")
    }
}
