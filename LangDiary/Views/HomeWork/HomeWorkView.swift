//
//  HomeWorkView.swift
//  LangDiary
//
//  Created by Роман on 09.08.2024.
//

import SwiftUI

struct HomeWorkView: View {
    
    @StateObject var vm: MainViewModel
    
    var body: some View {
        ZStack {
            //MARK: - Background
            Color.main.ignoresSafeArea()
            //MARK: - Main stack
            VStack {
                //MARK: - Toolbar
                HStack {
                    Button {
                        vm.isPresentHomeWork.toggle()
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 15, height: 20)
                            .foregroundStyle(.white)
                    }
                    Spacer()
                    Text("Homework")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                        .offset(x: 6)
                    Spacer()
                    
                }
                
                Spacer()
                
                Button(action: {
                    vm.isPresentHomeWork.toggle()
                }, label: {
                    CustomButtonView(text: "Add new")
                })
            }.padding()
        }
    }
}

#Preview {
    HomeWorkView(vm: MainViewModel())
}
