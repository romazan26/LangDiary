//
//  WordCell.swift
//  LangDiary
//
//  Created by Роман on 09.08.2024.
//

import SwiftUI

struct WordCellView: View {
    let word: Word
    var body: some View {
        ZStack {
            Color.second
            Text("\(word.title ?? "")")
                .foregroundStyle(.white)
                .font(.system(size: 18, weight: .heavy))
        }
        .frame(width: 164, height: 64)
        .cornerRadius(19)
    }
}

#Preview {
    WordCellView(word: Word())
}
