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
            animatedImage = UIImage.animatedImage(with: outputAnimasiApiPanjang(), duration: 16)
        default:
            animatedImage = UIImage.animatedImage(with: apiBesar, duration: 0.5)
        }
        let someView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        let someImage = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
        someImage.clipsToBounds = true
        someImage.autoresizesSubviews = true
        someImage.contentMode = UIView.ContentMode.scaleAspectFit
        someImage.image = animatedImage
        someView.backgroundColor = .clear
        someView.addSubview(someImage)
        return someView
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<FireAnimation>) {
    }
    func outputAnimasiApiPanjang()-> [UIImage] {
        var ini2 = [UIImage]()
        let apiBesar2 = penggandaApi(inputApi: apiBesar)
        let apiSedang2 = penggandaApi(inputApi: apiSedang)
        let apiKecil2 = penggandaApi(inputApi: apiKecil)
        ini2.append(contentsOf: apiBesar2)
        ini2.append(contentsOf: apiSedang2)
        ini2.append(contentsOf: apiKecil2)
        ini2.append(contentsOf: apiSedang2)
        return ini2
    }
    func penggandaApi(inputApi: [UIImage])-> [UIImage] {
        var ini : [UIImage] = []
        ini.append(contentsOf: inputApi)
        ini.append(contentsOf: inputApi)
        ini.append(contentsOf: inputApi)
        ini.append(contentsOf: inputApi)
        ini.append(contentsOf: inputApi)
        ini.append(contentsOf: inputApi)
        return ini
    }
}


struct WorkoutView: PreviewProvider {
    static var previews: some View {
        VStack {
            FireAnimation(imageName: "apiSemua", x: 0, y: 0, width: 200, height: 200)
        }
    }
}
