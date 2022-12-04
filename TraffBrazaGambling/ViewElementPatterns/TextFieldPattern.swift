//
//  TextFieldPattern.swift
//  TraffBrazaGambling
//
//  Created by Vlad Kyrylenko on 02.12.2022.
//

import SwiftUI

struct TextFieldPattern: View{
    @Binding var text: String
    var topLabel: String
    var placeholderText: String
    let unremovablePrefix: String
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: -2.0) {
            Text(topLabel)
                .font(.system(size: 16))
                .padding(.leading, 5)
            TextField(placeholderText, text: $text)
                .padding(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 1)
                )
                .padding(5)
                .onChange(of: text) { newValue in
                        if !newValue.hasPrefix(unremovablePrefix) {
                            text = unremovablePrefix + self.text
                            self.text = text
                        }
                    }
        }
    }
}

struct TextFieldForNumericConversion_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldPattern(text: .constant(""), topLabel: "Test", placeholderText: "Tes1", unremovablePrefix: "")
    }
}
