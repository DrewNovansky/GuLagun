//
//  HistoryPage.swift
//  MacroChalTestUnit
//
//  Created by Andrew Novansky Ignatius on 21/10/20.
//

import SwiftUI
import CoreData

struct comment : Identifiable {
    var id: Int
    
    let Date: String
    let comment: String
}
var commentList = [comment(id: 0, Date: "20 oktober", comment: "testing"),comment(id: 1, Date: "1 november", comment: "Welcome to November")]
struct HistoryPage: View {
    var emotionChoosen = ""
    var emotionDetails = "Grateful"
    var story = ""
    var acceptenceText = ""
    var heartOn:Bool
    var tanggal: String
    var jam: String
    var datayangmana: DiaryDatabase
    @Environment(\.managedObjectContext) private var viewContext
    @State var buttonComment = true
    @State var commentField = false
    @State var halfModal = false
    @State var commentText = ""
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    TitleTemp(title: "\(tanggal)")
                    SubtitleTemp(subtitle: "\(jam)")
                    reviewTemp(emotionChoosen: emotionChoosen, emotionDetails: emotionDetails, story: story, acceptenceText: acceptenceText, heartOn: heartOn)
//                    SubtitleTemp(subtitle: "Note to self:")
//                    ForEach(0 ..< commentList.count) { item in
//                        ScrollView{
//                            SubtitleTemp(subtitle: commentList[item].Date)
//                            SubtitleTemp(subtitle: commentList[item].comment)
//                        }
//                        .frame(width: 354, height: 135, alignment: .center)
//                        .padding()
//                        .background(Color("CommentColor"))
//                        .cornerRadius(20)
//                    }
//                    if commentField{
//                        multilineTF(placeholder: "Write Here...", textWritten: $commentText)
//                    }
//                    Button(action: {
//                        if buttonComment{
//
//                            commentField.toggle()
//                            buttonComment.toggle()
//                        } else if buttonComment == false{
//                            if heartOn == false{
//                                halfModal.toggle()
//                            }
//                            commentField.toggle()
//                            buttonComment.toggle()
//                        }
//                    }, label: {
//                        if buttonComment{
//                            buttonStyleTemplate(text: "add comment")
//                        } else if buttonComment == false{
//                            buttonStyleTemplate(text: "save comment")
//                        }
//                    })
//                }
//            }
//            if halfModal {
//                VStack{
//                    var i = 0
//                    SlideOverCard { cardModal(heartState: heartOn) }
//
//                    Button(action:{
//                        halfModal.toggle()
//                        commentList.append(comment(id: commentList.count+1, Date: "Date", comment: commentText))
//                        while i<commentList.count{
//                            print(commentList[i])
//                            i+=1
//                        }
//                    },label: {
//                        buttonStyleTemplate(text: "Save")
//                    }).offset(y: -UIScreen.main.bounds.height/10)
//
//                }
//            }
                    
        }
                
    }
            
}
    }
    func saveComment() {
        let diary = Commentary(context: viewContext)
        diary.children = datayangmana
        diary.comment = "" // komen di sini
        diary.timestamp = Date()
        //Save context
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
