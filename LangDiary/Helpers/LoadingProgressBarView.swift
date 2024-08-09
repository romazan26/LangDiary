//
//  LoadingProgressBarView.swift
//  LangDiary
//
//  Created by Роман on 09.08.2024.
//

import SwiftUI

struct LoadingProgressBarView: View {
    var progress = 30
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.second)
                .frame(width: 271)
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.orangeApp)
                .frame(width: 273 / 100 * CGFloat(progress))
        }
        .frame(height: 16)
        .padding()
    }
}


#Preview {
    LoadingProgressBarView()
}
