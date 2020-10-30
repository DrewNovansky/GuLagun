//
//  HistoryNoCalendarTest.swift
//  MacroChal
//
//  Created by Steven Rafaelie on 28/10/20.
//

import SwiftUI
import CoreData

struct HistoryNoCalendarTest: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: DiaryDatabase.entity(), sortDescriptors: [NSSortDescriptor(key: "timestamp", ascending: true)]) var result : FetchedResults<DiaryDatabase>
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        Text("Your Writings").font(.title).fontWeight(.semibold)
            .multilineTextAlignment(.center
            ).foregroundColor(.accentColor).offset(y:-40)
        
        List {
            ForEach(self.result) {timestamp in
                VStack {
                    HStack{
                        Image("\(timestamp.emotionChoosen ?? "")").resizable().frame(width:50, height:50)
                            .padding()
                        VStack(alignment: .leading){
                            Text(CekTanggal(tanggalInput: timestamp.timestamp ?? Date(), minta: "tanggal")).foregroundColor(.accentColor)
                            //tanggal
                            Text(timestamp.story ?? "")
                                .frame(height: 25).foregroundColor(.accentColor)
                        }
                        
                        Spacer()
                        VStack{
                            Text(CekTanggal(tanggalInput: Date(), minta: "")).foregroundColor(.accentColor)
                            if timestamp.heartOn == true{
                                Image("Heart.Fill")
                                    .renderingMode(.none).resizable()
                                    .frame(width: 26, height: 24)
                                    .padding(2)
                            }else if timestamp.heartOn == false{
                                Image("Heart")
                                    .renderingMode(.none).resizable()
                                    .frame(width: 26, height: 24)
                                    .padding(2)
                            }
                        }
                        .padding()
                    }
                    
                }.frame(width:380, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).padding(0).background(Color("WriteColor")).cornerRadius(20)
            }
        }.offset(y:-30)
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

struct HistoryNoCalendarTest_Previews: PreviewProvider {
    static var previews: some View {
        HistoryNoCalendarTest()
    }
}
