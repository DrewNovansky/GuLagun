//
//  HistoryPageView.swift
//  Onboarding try
//
//  Created by Jenifer Yolanda on 21/10/20.
//

import SwiftUI

struct HistoryPageView: View {
    var body: some View {
        VStack {
            Text("History")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color("AccentColor")).padding()
            
            CalendarDetails()
        }.offset(y: -50)
    }
}

struct HistoryPageView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryPageView()
    }
}

