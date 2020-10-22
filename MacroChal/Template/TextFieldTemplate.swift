//
//  TextFieldTemplate.swift
//  MacroChalTestUnit
//
//  Created by Andrew Novansky Ignatius on 22/10/20.
//

import SwiftUI

//multilineTF yang digunakan untuk memanggil textfield
struct multilineTF :View {
    var placeholder = ""
    var body: some View{
        MultiLineTextField(placeholder: placeholder)
            .frame(width: 374,height: 336)
            .padding(10)
            .background(Color("TextfieldColor"))
            .cornerRadius(20)
    }
}
struct MultiLineTextField : UIViewRepresentable {
    @State var placeholder = ""
    
    func makeCoordinator() -> MultiLineTextField.Coordinator {
        return MultiLineTextField.Coordinator(parent1: self)
    }
    func makeUIView(context: UIViewRepresentableContext<MultiLineTextField>) -> UITextView {
        let view = UITextView()
        view.font = .systemFont(ofSize: 19)
        view.text = placeholder
        view.textAlignment = .center
        view.textColor = UIColor.black.withAlphaComponent(0.35)
        view.backgroundColor = .clear
        view .delegate = context.coordinator
        
        
        view.isEditable = true
        view.isUserInteractionEnabled = true
        view.isScrollEnabled = true
        return view
    }
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<MultiLineTextField>) {
        
    }
    class Coordinator: NSObject,UITextViewDelegate {
        var parent : MultiLineTextField
        init(parent1 : MultiLineTextField){
            parent = parent1
        }
        func textViewDidBeginEditing(_ textView: UITextView) {
            textView.text = ""
            textView.textColor = .black
        }
        func textViewDidChange(_ textView: UITextView) {
            
        }
    }
}
struct TextFieldTemplate_Previews: PreviewProvider {
    static var previews: some View {
        multilineTF()
    }
}
