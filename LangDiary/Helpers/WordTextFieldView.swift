//
//  WordTextFieldView.swift
//  LangDiary
//
//  Created by Роман on 09.08.2024.
//

import SwiftUI

struct WordTextFieldView: View {
    var placeholder = ""
    @Binding var text: String
    var body: some View {
        ZStack(alignment: .leading) {
            Color.main
                .overlay {
                    RoundedRectangle(cornerRadius: 19)
                        .stroke(.gray.opacity(0.5), lineWidth: 2.0)
                }
            if text.isEmpty {
                Text(placeholder)
                    .padding()
                    .foregroundStyle(.white.opacity(0.4))
            }
            TextField("", text: $text)
                .padding()
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
        }
        .cornerRadius(19)
        .frame(maxWidth: .infinity)
        .frame(width: 164,height: 64)
    }
}

#Preview {
    WordTextFieldView( text: .constant("word"))
}
