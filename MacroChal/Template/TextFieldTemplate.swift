//
//  TextFieldTemplate.swift
//  MacroChalTestUnit
//
//  Created by Andrew Novansky Ignatius on 22/10/20.
//

import SwiftUI

//multilineTF yang digunakan untuk memanggil textfield
struct multilineTF :View {
    @State var placeholder = "test"
    @Binding var textWritten: String
    var body: some View{
        VStack{
            MultiLineTextField(placeholder: $placeholder,story: $textWritten)
                .frame(width: 374,height: 336)
                .padding(10)
                .background(Color("TextfieldColor"))
                .cornerRadius(20)
        }
    }
}
struct MultiLineTextField : UIViewRepresentable {
    @Binding var placeholder: String
    @Binding var story: String
    func makeCoordinator() -> MultiLineTextField.Coordinator {
        return MultiLineTextField.Coordinator(parent1: self, placeholder: placeholder, story: $story)
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
        var story: Binding<String>
        var placeholder: String
        init(parent1 : MultiLineTextField,placeholder : String,story : Binding<String>){
            parent = parent1
            self.story = story
            self.placeholder = placeholder
        }
        func textViewDidBeginEditing(_ textView: UITextView) {
            textView.text = placeholder
            story.wrappedValue = textView.text
            textView.textColor = .black
        }
        internal func textViewDidChange(_ textView: UITextView) {
            story.wrappedValue = textView.text
        }
    }
}
struct TextFieldTemplate_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hai")
    }
}
