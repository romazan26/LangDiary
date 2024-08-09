//
//  CustomButtonView.swift
//  FastTrack
//
//  Created by Роман on 24.07.2024.
//

import SwiftUI

struct CustomButtonView: View {
    var text = "Begin"
    var body: some View {
        ZStack {
            Color.orangeApp
            Text(text)
                .foregroundStyle(.white)
                .font(.system(size: 19, weight: .heavy))
        }
        .frame(width: 337, height: 65)
        .cornerRadius(20)
    }
}

#Preview {
    CustomButtonView()
}
