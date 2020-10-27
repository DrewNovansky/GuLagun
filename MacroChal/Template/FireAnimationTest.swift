//
//  FireAnimationTest.swift
//  MacroChal
//
//  Created by Steven Rafaelie on 26/10/20.
//

//import SwiftUI
//
//class LoadingTimer {
//
//    let publisher = Timer.publish(every: 0.1, on: .main, in: .default)
//    private var timerCancellable: Cancellable?
//
//    func start() {
//        self.timerCancellable = publisher.connect()
//    }
//
//    func cancel() {
//        self.timerCancellable?.cancel()
//    }
//}
//
//struct LoadingView: View {
//
//    @State private var index = 0
//
//    private let images = (0...7).map { UIImage(named: "Image-\($0).jpg")! }
//    private var timer = LoadingTimer()
//
//    var body: some View {
//
//        return Image(uiImage: images[index])
//            .resizable()
//            .frame(width: 100, height: 100, alignment: .center)
//            .onReceive(
//                timer.publisher,
//                perform: { _ in
//                    self.index = self.index + 1
//                    if self.index >= 7 { self.index = 0 }
//                }
//            )
//            .onAppear { self.timer.start() }
//            .onDisappear { self.timer.cancel() }
//    }
//}
