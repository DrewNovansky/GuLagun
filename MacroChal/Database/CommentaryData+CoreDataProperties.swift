//
//  CommentaryData+CoreDataProperties.swift
//  ForRest
//
//  Created by Steven Rafaelie on 11/11/20.
//
//

import Foundation
import CoreData


extension CommentaryData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CommentaryData> {
        return NSFetchRequest<CommentaryData>(entityName: "CommentaryData")
    }

    @NSManaged public var comment: String
    @NSManaged public var timestampComment: Date
    @NSManaged public var children: DiaryDatabase

}
extension CommentaryData : Identifiable {

}
