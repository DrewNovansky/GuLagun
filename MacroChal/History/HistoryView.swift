//
//  HistoryNoCalendarTest.swift
//  MacroChal
//
//  Created by Steven Rafaelie on 28/10/20.
//

import SwiftUI
import CoreData

struct HistoryView: View {
    @State var emotionChoosen = ""
    @State var emotionDetails = ""
    @State var story = ""
    @State var acceptenceText = ""
    @State var heartOn = false
    @State var tanggal = ""
    @State var jam = ""
    @State var databaseyang: DiaryDatabase = DiaryDatabase()
    @State var showNew = false
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: DiaryDatabase.entity(), sortDescriptors: [NSSortDescriptor(key: "timestamp", ascending: true)]) var result : FetchedResults<DiaryDatabase>
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack{
            Text("Your Writings")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .foregroundColor(.accentColor)
                .offset(y:-UIScreen.main.bounds.height*0.04)
              
            ScrollView{
            if result.endIndex == 0 {
                Text("It's seems you haven't tell us any story let's start expressing")
                    .padding()
                Spacer()
                    .frame(height:UIScreen.main.bounds.width)
                NavigationLink(
                    destination: FocusBreathingPage(),
                    label: {
                        buttonStyleTemplate(text: "Let's Go Express")
                    })
            }
            else{
            NavigationLink(destination: HistoryPage(emotionChoosen: emotionChoosen, emotionDetails: emotionDetails, story: story, acceptenceText: acceptenceText, heartOn: heartOn, tanggal: tanggal, jam: jam, datayangmana: databaseyang, buttonComment: true, commentField: false, halfModal: false, commentText: ""), isActive: $showNew){
                VStack{
                    ForEach(self.result) {timestamp in
                        Button(action: {
                            if timestamp.emotionChoosen != "" && timestamp.emotionDetail != ""{
                                self.emotionChoosen = timestamp.emotionChoosen ?? ""
                                self.emotionDetails = timestamp.emotionDetail ?? ""
                                self.story = timestamp.story ?? ""
                                self.acceptenceText = timestamp.acceptanceText ?? ""
                                self.heartOn = timestamp.heartOn
                                self.tanggal = CekTanggal(tanggalInput: timestamp.timestamp ?? Date(), minta: "tanggal")
                                self.jam = CekTanggal(tanggalInput: timestamp.timestamp ?? Date(), minta: "")
                                self.showNew = true
                                self.databaseyang = timestamp
                            }
                            else { self.emotionDetails = ""
                                self.story = ""
                                self.acceptenceText = ""
                                self.heartOn = false
                                self.tanggal = ""
                                self.jam = ""
                                self.showNew = false}
                        }, label: {
                            HStack{
                                Image("\(timestamp.emotionChoosen ?? "")")
                                    .resizable()
                                    .frame(width:50, height:50)
                                    .padding()
                                
                                VStack(alignment: .leading){
                                    Text(CekTanggal(tanggalInput: timestamp.timestamp ?? Date(), minta: "tanggal"))
                                        .foregroundColor(.accentColor)
                                    //tanggal
                                    Text(timestamp.story ?? "")
                                        .frame(height: 25)
                                        .foregroundColor(.accentColor)
                                }
                                Spacer()
                                VStack{
                                    Text(CekTanggal(tanggalInput: timestamp.timestamp ?? Date(), minta: ""))
                                        .foregroundColor(.accentColor)
                                    
                                    if timestamp.heartOn == true{
                                        Image("Heart.Fill")
                                            .renderingMode(.none)
                                            .resizable()
                                            .frame(width: 26, height: 24)
                                            .padding(2)
                                        
                                    }else if timestamp.heartOn == false{
                                        Image("Heart")
                                            .renderingMode(.none)
                                            .resizable()
                                            .frame(width: 26, height: 24)
                                            .padding(2)
                                    }
                                }.padding()
                            }
                            .frame(width:380, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                            .background(Color("WriteColor"))
                            .cornerRadius(20)
                            .padding(5)
                        })
                        
                        
                    }
                }
            }.offset(y:UIScreen.main.bounds.height*0.01)
            }
            }
            Spacer()
        }
    }
    
    func CekTanggal(tanggalInput: Date, minta: String)-> String {
        let formatter3 = DateFormatter()
        var tanggalString: String = String()
        if minta == "tanggal" {
            formatter3.dateFormat = "d MMM y"
            tanggalString = formatter3.string(from: tanggalInput)
            return tanggalString
        } else {
            formatter3.dateFormat = "HH:mm"
            tanggalString = formatter3.string(from: tanggalInput)
            return tanggalString
        }
        
        
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
