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
    @Published var words: [Word] = []
    
    //Words
    @Published var simpleWord1 = ""
    @Published var simpleWord2 = ""
    @Published var isAddWord = false
    
    //Teachers
    @Published var simpleTeacherName = ""
    @Published var simpleTeacherSerName = ""
    @Published var simpleTeacherPhoto: UIImage = UIImage(resource: .noFotoTeacher)
    @Published var simpleTeacher: Teacher!
    
    //Is present
    @Published var isPresentAddteacher = false
    @Published var isPresentEdiiteteacher = false
    @Published var isPresentedPiker = false
    @Published var isPresentedAllTeacher = false
    @Published var isPresentSetting = false
    @Published var isPresentHomeWork = false
    
    init(){
        getTeachers()
        getWords()
    }
    
    //MARK: - 
    
    //MARK: - Update data
    func updateTeacher(){
        let request = NSFetchRequest<Teacher>(entityName: "Teacher")
        
        do{
            teachers = try manager.context.fetch(request)
            let teacher = teachers.first(where: {$0.id == simpleTeacher.id})
            teacher?.name = simpleTeacherName
            teacher?.serName = simpleTeacherSerName
            teacher?.photo = simpleTeacherPhoto
        }catch let error{
            print("Get data error \(error.localizedDescription)")
        }
        
        save()
        clearDataTeacher()
    }
    
    //MARK: - fiilData
    func fillData(){
        simpleTeacherName = simpleTeacher.name ?? ""
        simpleTeacherSerName = simpleTeacher.serName ?? ""
        simpleTeacherPhoto = simpleTeacher.photo ?? UIImage(resource: .noFoto)
        
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
    
    func addAllWords(){
        addWord(word: simpleWord1)
        addWord(word: simpleWord2)
        
        clearDataWords()
    }
    
    func addWord(word: String){
        let newWord = Word(context: manager.context)
        newWord.title = word
        
        save()
    }
    
    //MARK: - Get data
    func getTeachers(){
        let request = NSFetchRequest<Teacher>(entityName: "Teacher")
        
        do{
            teachers = try manager.context.fetch(request)
        }catch let error{
            print("Get data error \(error.localizedDescription)")
        }
    }
    
    func getWords(){
        let request = NSFetchRequest<Word>(entityName: "Word")
        
        do{
            words = try manager.context.fetch(request)
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
    
    func clearDataWords(){
        simpleWord1 = ""
        simpleWord2 = ""
    }
    
    //MARK: - Save data
    func save(){
        teachers.removeAll()
        words.removeAll()
        
        manager.save()
        
        getTeachers()
        getWords()
    }
}
