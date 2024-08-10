//
//  HomeWorkCell.swift
//  LangDiary
//
//  Created by Роман on 11.08.2024.
//

import SwiftUI

struct HomeWorkCell: View {
    let homeWork: HomeWork
    var body: some View {
        ZStack {
            Color.second
            HStack {
                Text("\(homeWork.exercise ?? ""), \(homeWork.task ?? "")")
                    .foregroundStyle(.white)
                    .font(.system(size: 15, weight: .heavy))
                Spacer()
                Text(Dateformatter(date: Date()))
                    .font(.system(size: 14, weight: .heavy))
                    .foregroundStyle(.white)
                    .padding(5)
                    .background {Color.orangeApp.cornerRadius(86)}
            }.padding()
        }
        .minimumScaleFactor(0.5)
        .frame(width: 337, height: 64)
            .cornerRadius(19)
    }
    //MARK: - Dateformatter
    private func Dateformatter(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d.M.yyyy"
        return dateFormatter.string(from: date)
    }
}

#Preview {
    HomeWorkCell(homeWork: HomeWork())
}

