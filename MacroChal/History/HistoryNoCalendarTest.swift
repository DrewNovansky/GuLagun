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
            ).foregroundColor(.accentColor)
        
        List {
            ForEach(self.result) {timestamp in
                
                VStack {
                    HStack{
                        Image("\(timestamp.emotionChoosen ?? "")").resizable().frame(width:70, height:70)
                        
                        VStack(alignment: .leading){
                            //Text("\(timestamp.timestamp!)")
                            Text(timestamp.story ?? "")
                        }
                        
                        VStack{
                            //Text("\(timestamp.timestamp!)")
                            if timestamp.heartOn == true{
                                Image("Heart.Fill")
                                    .renderingMode(.none)
                                    .font(.system(size: 45))
                                    .padding()
                            }else if timestamp.heartOn == false{
                                Image("Heart")
                                    .renderingMode(.none)
                                    .font(.system(size: 45))
                                    .padding()
                            }
                        }
                    }
                    
                }.frame(width:380, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).padding(0).background(Color("WriteColor")).cornerRadius(30)
            }
        }
    }
}

struct HistoryNoCalendarTest_Previews: PreviewProvider {
    static var previews: some View {
        HistoryNoCalendarTest()
    }
}
