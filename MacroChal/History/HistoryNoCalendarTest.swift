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
        List {
        ForEach(result) { task in
            Text(task.story ?? "")
            Text(task.acceptanceText ?? "") 
        }
        }
    }
}

struct HistoryNoCalendarTest_Previews: PreviewProvider {
    static var previews: some View {
        HistoryNoCalendarTest()
    }
}
