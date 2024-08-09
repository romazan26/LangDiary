//
//  TeacherCell.swift
//  LangDiary
//
//  Created by Роман on 09.08.2024.
//

import SwiftUI

struct TeacherCell: View {
    
    @ObservedObject var teacher: Teacher
    
    var width: CGFloat = 73
    var height: CGFloat = 105
    var textsize: CGFloat = 15
    
    var body: some View {
        VStack {
            //MARK: - Image
            if let imgData = teacher.photo{
                    Image(uiImage: imgData)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: width, height: width)
                        .cornerRadius(width / 3.8)
                    
            }else {
                Image(.noFoto)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            Text("\(teacher.name ?? "") \(teacher.serName ?? "")")
                .minimumScaleFactor(0.5)
                .foregroundStyle(.gray)
                .font(.system(size: textsize, weight: .heavy))
        }
        .frame(width: width, height: height)
    }
}

#Preview {
    TeacherCell(teacher: Teacher())
}
