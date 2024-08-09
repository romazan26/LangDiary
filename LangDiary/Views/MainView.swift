//
//  MainView.swift
//  LangDiary
//
//  Created by Роман on 09.08.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var vmRegistration: RegistrationViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MainView(vmRegistration: RegistrationViewModel())
}
