//
//  CircleButton.swift
//  LangDiary
//
//  Created by Роман on 09.08.2024.
//

import SwiftUI

struct CircleButtonView: View {
    var image: ImageResource
    var body: some View {
        ZStack {
           Circle()
                .frame(width: 75)
                .foregroundStyle(.orangeApp)
            Image(image)
                .resizable()
                .frame(width: 25, height: 25)
        }
    }
}

#Preview {
    CircleButtonView(image: .homeworks)
}
