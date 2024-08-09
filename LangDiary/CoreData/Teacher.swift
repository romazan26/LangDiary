//
//  Teacher+CoreDataProperties.swift
//
//
//  Created by Роман on 09.08.2024.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData
import UIKit

@objc(Teacher)
public class Teacher: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Teacher> {
        return NSFetchRequest<Teacher>(entityName: "Teacher")
    }

    @NSManaged public var name: String?
    @NSManaged public var photo: UIImage?
    @NSManaged public var serName: String?

}

extension Teacher : Identifiable {

}
