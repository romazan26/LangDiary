//
//  LoadingView.swift
//  LangDiary
//
//  Created by Роман on 09.08.2024.
//

import SwiftUI

struct LoadingView: View {
    @State private var percents = 0
    @State private var isPresent = false
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Color.main.ignoresSafeArea()
            VStack {
                Text("LangDiary")
                    .foregroundStyle(.white)
                    .font(.system(size: 53, weight: .heavy))
                    .padding(.top, 150)
                Text("anguage learning assistant")
                    .foregroundStyle(.white)
                    .font(.system(size: 18))
                
                Spacer()
                
                VStack {
                    Text("\(percents)%")
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .heavy))
                    LoadingProgressBarView(progress: percents)
                }
            }.padding()
        }
        .fullScreenCover(isPresented: $isPresent, content: {
            Registrationview()
        })
        .onAppear(perform: {
            Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
                if percents < 100{
                    percents += 1
                }else {
                    timer.invalidate()
                    isPresent = true
                }
            }
        })
        
        
    }
}

#Preview {
    LoadingView()
}
