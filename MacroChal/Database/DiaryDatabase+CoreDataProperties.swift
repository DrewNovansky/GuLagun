//
//  DiaryDatabase+CoreDataProperties.swift
//  ForRest
//
//  Created by Steven Rafaelie on 11/11/20.
//
//

import Foundation
import CoreData


extension DiaryDatabase {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DiaryDatabase> {
        return NSFetchRequest<DiaryDatabase>(entityName: "DiaryDatabase")
    }

    @NSManaged public var acceptanceText: String
    @NSManaged public var emotionChoosen: String
    @NSManaged public var emotionDetail: String
    @NSManaged public var heartOn: Bool
    @NSManaged public var story: String
    @NSManaged public var timestamp: Date
    @NSManaged public var parent: NSSet

}

// MARK: Generated accessors for parent
extension DiaryDatabase {

    @objc(addParentObject:)
    @NSManaged public func addToParent(_ value: CommentaryData)

    @objc(removeParentObject:)
    @NSManaged public func removeFromParent(_ value: CommentaryData)

    @objc(addParent:)
    @NSManaged public func addToParent(_ values: NSSet)

    @objc(removeParent:)
    @NSManaged public func removeFromParent(_ values: NSSet)

}

extension DiaryDatabase : Identifiable {

}
