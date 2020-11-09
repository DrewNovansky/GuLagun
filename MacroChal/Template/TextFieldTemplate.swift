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
    @Binding var keyboardState: Bool
    var body: some View{
        VStack{
            MultiLineTextField(placeholder: $placeholder,story: $textWritten, keyboardState: $keyboardState)
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
    @Binding var keyboardState: Bool
    func makeCoordinator() -> MultiLineTextField.Coordinator {
        return MultiLineTextField.Coordinator(parent1: self, placeholder: placeholder, story: $story, keyboardState: $keyboardState)
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
        var keyboardState: Binding<Bool>
        init(parent1 : MultiLineTextField,placeholder : String,story : Binding<String>,keyboardState: Binding<Bool>){
            parent = parent1
            self.story = story
            self.keyboardState = keyboardState
            self.placeholder = placeholder
        }
        func textViewDidBeginEditing(_ textView: UITextView) {
            textView.text = placeholder
            placeholder = textView.text
            keyboardState.wrappedValue = true
            story.wrappedValue = textView.text
            textView.textColor = UIColor(Color("FontColor"))
        }
        internal func textViewDidChange(_ textView: UITextView) {
            keyboardState.wrappedValue = true
            story.wrappedValue = textView.text
            placeholder = textView.text
        }
    }
}
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
struct TextFieldTemplate_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hai")
    }
}
