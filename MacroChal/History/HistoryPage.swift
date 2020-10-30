//
//  HistoryPage.swift
//  MacroChalTestUnit
//
//  Created by Andrew Novansky Ignatius on 21/10/20.
//

import SwiftUI
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
    @State var buttonComment = true
    @State var commentField = false
    @State var halfModal = false
    @State var commentText = ""
    var body: some View {
        ZStack{
            VStack{
                //                ScrollView{
                TitleTemp(title: "\(tanggal)")
                SubtitleTemp(subtitle: "\(jam)")
                reviewTemp(emotionChoosen: emotionChoosen, emotionDetails: emotionDetails, story: story, acceptenceText: acceptenceText, heartOn: heartOn)
                //                    SubtitleTemp(subtitle: "Note to self:")
                //
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
                //
                //                        }
                //
                //                    }, label: {
                //                        if buttonComment{
                //                            buttonStyleTemplate(text: "add comment")
                //                        } else if buttonComment == false{
                //                            buttonStyleTemplate(text: "save comment")
                //                        }
                //
                //                    })
            }.offset(y: -30)
        }
        //            if halfModal {
        //                VStack{
        //                    SlideOverCard { cardModal(heartState: heartOn) }
        //                    Button(action:{
        //                        halfModal.toggle()
        //                    },label: {
        //                        buttonStyleTemplate(text: "Save")
        //                    }).offset(y: -70)
        //                }
        //            }
        
    }
}

struct HistoryPage_Previews: PreviewProvider {
    static var previews: some View {
        HistoryPage(emotionChoosen: "Joy", emotionDetails: "Grateful", story: "I feel Grateful Because i acomplish this project", acceptenceText: "Because I have done a good job in fulfiling my task", heartOn: true, tanggal: "30 October", jam: "21.20", buttonComment: true, commentField: false, halfModal: false, commentText: "")
    }
}
