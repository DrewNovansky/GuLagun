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
                    
                    SubtitleTemp(subtitle: "Note to self:")
                     //ini untuk scroll view nya munculin
                    ForEach(self.commentTest) { isiKomen in
                        ScrollView{
                            SubtitleTemp(subtitle: isiKomen.comment)
                            SubtitleTemp(subtitle:
                            ""//isiKomen.timestampComment)
                            )
                        }
                        .frame(width: 354, height: 135, alignment: .center)
                        .padding()
                        .background(Color("CommentColor"))
                        .cornerRadius(20)
                    }
                    if commentField{
                        multilineTF(placeholder: "Write Here...", textWritten: $commentText, keyboardState: $keyboardState)
                    }
                    Button(action: {
                        if buttonComment{
                            commentField.toggle()
                            buttonComment.toggle()
                        } else if buttonComment == false{
                            if heartOn == false{
                                halfModal.toggle()
                            }
                            commentField.toggle()
                            buttonComment.toggle()
                        }
                    }, label: {
                        if buttonComment{
                            buttonStyleTemplate(text: "Add Comment")
                        } else if buttonComment == false{
                            buttonStyleTemplate(text: "Save Comment")
                        }
                    })
                
            }.offset(y:UIScreen.main.bounds.height*0.01)
            }.offset(y:-UIScreen.main.bounds.height*0.011)
            if halfModal {
                VStack{
                    SlideOverCard {
                        cardModal(heartState: $heartOn)
                    }

                    Button(action:{
                        halfModal.toggle()
                        saveComment()
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
}

struct HistoryPage_Previews: PreviewProvider {
    static var previews: some View {
        HistoryPage(emotionChoosen: "Joy", emotionDetails: "Grateful", story: "", acceptenceText: "", heartOn: false,tanggal: "",jam:"", datayangmana: DiaryDatabase(), buttonComment: true, commentField: false, halfModal: false, commentText: "")
    }
}
