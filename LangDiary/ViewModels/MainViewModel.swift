//
//  MainViewModel.swift
//  LangDiary
//
//  Created by Роман on 09.08.2024.
//

import Foundation
import UIKit
import CoreData

final class MainViewModel: ObservableObject{
    
    let manager = CoreDataManager.instance
    
    @Published var teachers:[Teacher] = []
    
    @Published var simpleTeacherName = ""
    @Published var simpleTeacherSerName = ""
    @Published var simpleTeacherPhoto: UIImage = UIImage(resource: .noFotoTeacher)
    
    @Published var isPresentAddteacher = false
    @Published var isPresentedPiker = false
    
    init(){
        getTeachers()
    }
    
    //MARK: - Add Data
    func addTeacher(){
        let newTeacher = Teacher(context: manager.context)
        newTeacher.name = simpleTeacherName
        newTeacher.serName = simpleTeacherSerName
        newTeacher.photo = simpleTeacherPhoto
        
        save()
        clearDataTeacher()
    }
    
    //MARK: Get data
    func getTeachers(){
        let request = NSFetchRequest<Teacher>(entityName: "Teacher")
        
        do{
            teachers = try manager.context.fetch(request)
        }catch let error{
            print("Get data error \(error.localizedDescription)")
        }
    }
    
    //MARK: - Clear data
    func clearDataTeacher(){
        simpleTeacherName = ""
        simpleTeacherSerName = ""
        simpleTeacherPhoto = UIImage(resource: .addteacher)
    }
    
    //MARK: - Save data
    func save(){
        teachers.removeAll()
        manager.save()
        getTeachers()
    }
}
