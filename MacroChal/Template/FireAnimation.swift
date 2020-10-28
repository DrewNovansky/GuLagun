//
//  FireAnimation.swift
//  TestingMacro
//
//  Created by Steven Rafaelie on 22/10/20.
//

import SwiftUI

var apiBesar : [UIImage]! = [UIImage(named: "api besar 1")!, UIImage(named: "api besar 2")!, UIImage(named: "api besar 3")!, UIImage(named: "api besar 4")!, UIImage(named: "api besar 5")!, UIImage(named: "api besar 6")!]
var apiKecil : [UIImage]! = [UIImage(named: "api kecil 1")!, UIImage(named: "api kecil 2")!, UIImage(named: "api kecil 3")!, UIImage(named: "api kecil 4")!, UIImage(named: "api kecil 5")!, UIImage(named: "api kecil 6")!]
var apiSedang : [UIImage]! = [UIImage(named: "api sedang 1")!, UIImage(named: "api sedang 2")!, UIImage(named: "api sedang 3")!, UIImage(named: "api sedang 4")!, UIImage(named: "api sedang 5")!, UIImage(named: "api sedang 6")!]
var kayuBakar : [UIImage]! = [UIImage(named: "kayuBakar1")!, UIImage(named: "kayuBakar2")!, UIImage(named: "kayuBakar3")!, UIImage(named: "kayuBakar4")!, UIImage(named: "kayuBakar5")!, UIImage(named: "kayuBakar6")!]
var apiSemua : [UIImage]! = [UIImage(named: "api besar 1")!, UIImage(named: "api besar 2")!, UIImage(named: "api besar 3")!, UIImage(named: "api besar 4")!, UIImage(named: "api besar 5")!, UIImage(named: "api besar 6")!,UIImage(named: "api besar 1")!, UIImage(named: "api besar 2")!, UIImage(named: "api besar 3")!, UIImage(named: "api besar 4")!, UIImage(named: "api besar 5")!, UIImage(named: "api besar 6")!,UIImage(named: "api besar 1")!, UIImage(named: "api besar 2")!, UIImage(named: "api besar 3")!, UIImage(named: "api besar 4")!, UIImage(named: "api besar 5")!, UIImage(named: "api besar 6")!,UIImage(named: "api besar 1")!, UIImage(named: "api besar 2")!, UIImage(named: "api besar 3")!, UIImage(named: "api besar 4")!, UIImage(named: "api besar 5")!, UIImage(named: "api besar 6")!,UIImage(named: "api besar 1")!, UIImage(named: "api besar 2")!, UIImage(named: "api besar 3")!, UIImage(named: "api besar 4")!, UIImage(named: "api besar 5")!, UIImage(named: "api besar 6")!,UIImage(named: "api besar 1")!, UIImage(named: "api besar 2")!, UIImage(named: "api besar 3")!, UIImage(named: "api besar 4")!, UIImage(named: "api besar 5")!, UIImage(named: "api besar 6")!,UIImage(named: "api besar 1")!, UIImage(named: "api besar 2")!, UIImage(named: "api besar 3")!, UIImage(named: "api besar 4")!, UIImage(named: "api besar 5")!, UIImage(named: "api besar 6")!,UIImage(named: "api besar 1")!, UIImage(named: "api besar 2")!, UIImage(named: "api besar 3")!, UIImage(named: "api besar 4")!, UIImage(named: "api besar 5")!, UIImage(named: "api besar 6")!,UIImage(named: "api sedang 1")!, UIImage(named: "api sedang 2")!, UIImage(named: "api sedang 3")!, UIImage(named: "api sedang 4")!, UIImage(named: "api sedang 5")!, UIImage(named: "api sedang 6")!,UIImage(named: "api sedang 1")!, UIImage(named: "api sedang 2")!, UIImage(named: "api sedang 3")!, UIImage(named: "api sedang 4")!, UIImage(named: "api sedang 5")!, UIImage(named: "api sedang 6")!,UIImage(named: "api sedang 1")!, UIImage(named: "api sedang 2")!, UIImage(named: "api sedang 3")!, UIImage(named: "api sedang 4")!, UIImage(named: "api sedang 5")!, UIImage(named: "api sedang 6")!,UIImage(named: "api sedang 1")!, UIImage(named: "api sedang 2")!, UIImage(named: "api sedang 3")!, UIImage(named: "api sedang 4")!, UIImage(named: "api sedang 5")!, UIImage(named: "api sedang 6")!,UIImage(named: "api sedang 1")!, UIImage(named: "api sedang 2")!, UIImage(named: "api sedang 3")!, UIImage(named: "api sedang 4")!, UIImage(named: "api sedang 5")!, UIImage(named: "api sedang 6")!,UIImage(named: "api besar 6")!,UIImage(named: "api sedang 1")!, UIImage(named: "api sedang 2")!, UIImage(named: "api sedang 3")!, UIImage(named: "api sedang 4")!, UIImage(named: "api sedang 5")!, UIImage(named: "api sedang 6")!,UIImage(named: "api sedang 1")!, UIImage(named: "api sedang 2")!, UIImage(named: "api sedang 3")!, UIImage(named: "api sedang 4")!, UIImage(named: "api sedang 5")!, UIImage(named: "api sedang 6")!, UIImage(named: "api sedang 1")!, UIImage(named: "api sedang 2")!, UIImage(named: "api sedang 3")!, UIImage(named: "api sedang 4")!, UIImage(named: "api sedang 5")!, UIImage(named: "api sedang 6")!, UIImage(named: "api kecil 1")!, UIImage(named: "api kecil 2")!, UIImage(named: "api kecil 3")!, UIImage(named: "api kecil 4")!, UIImage(named: "api kecil 5")!, UIImage(named: "api kecil 6")!, UIImage(named: "api kecil 1")!, UIImage(named: "api kecil 2")!, UIImage(named: "api kecil 3")!, UIImage(named: "api kecil 4")!, UIImage(named: "api kecil 5")!, UIImage(named: "api kecil 6")!, UIImage(named: "api kecil 1")!, UIImage(named: "api kecil 2")!, UIImage(named: "api kecil 3")!, UIImage(named: "api kecil 4")!, UIImage(named: "api kecil 5")!, UIImage(named: "api kecil 6")!, UIImage(named: "api kecil 1")!, UIImage(named: "api kecil 2")!, UIImage(named: "api kecil 3")!, UIImage(named: "api kecil 4")!, UIImage(named: "api kecil 5")!, UIImage(named: "api kecil 6")!, UIImage(named: "api kecil 1")!, UIImage(named: "api kecil 2")!, UIImage(named: "api kecil 3")!, UIImage(named: "api kecil 4")!, UIImage(named: "api kecil 5")!, UIImage(named: "api kecil 6")!, UIImage(named: "api kecil 1")!, UIImage(named: "api kecil 2")!, UIImage(named: "api kecil 3")!, UIImage(named: "api kecil 4")!, UIImage(named: "api kecil 5")!, UIImage(named: "api kecil 6")!, UIImage(named: "api kecil 1")!, UIImage(named: "api kecil 2")!, UIImage(named: "api kecil 3")!, UIImage(named: "api kecil 4")!, UIImage(named: "api kecil 5")!, UIImage(named: "api kecil 6")!, UIImage(named: "api kecil 1")!, UIImage(named: "api kecil 2")!, UIImage(named: "api kecil 3")!, UIImage(named: "api kecil 4")!, UIImage(named: "api kecil 5")!, UIImage(named: "api kecil 6")!]

struct FireAnimation: UIViewRepresentable {
    var imageName: String
    var x:Int
    var y: Int
    var width: Int
    var height: Int
    
    func makeUIView(context: Self.Context) -> UIView {
        var animatedImage: UIImage?
        switch imageName {
        case "apiBesar":
            animatedImage = UIImage.animatedImage(with: apiBesar, duration: 0.5)
        case "apiKecil":
            animatedImage = UIImage.animatedImage(with: apiKecil, duration: 0.5)
        case "apiSedang":
            animatedImage = UIImage.animatedImage(with: apiSedang, duration: 0.5)
        case "kayuBakar":
            animatedImage = UIImage.animatedImage(with: kayuBakar, duration: 0.5)
        case "apiSemua":
            animatedImage = UIImage.animatedImage(with: apiSemua, duration: 12)
        default:
            animatedImage = UIImage.animatedImage(with: apiBesar, duration: 0.5)
        }
        let someView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        let someImage = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
        someImage.clipsToBounds = true
        someImage.autoresizesSubviews = true
        someImage.contentMode = UIView.ContentMode.scaleAspectFill
        someImage.image = animatedImage
        //someView.backgroundColor = .blue
        someView.addSubview(someImage)
        return someView
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<FireAnimation>) {
    }
}


struct WorkoutView: PreviewProvider {
    static var previews: some View {
        VStack (alignment: HorizontalAlignment.center, spacing: 10) {
            FireAnimation(imageName: "apiSemua", x: 20, y: 100, width: 360, height: 400)
        }
    }
}
