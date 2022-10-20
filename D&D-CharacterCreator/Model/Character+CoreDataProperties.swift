//
//  Character+CoreDataProperties.swift
//  D&D-CharacterCreator
//
//  Created by Cicero Nascimento on 20/10/22.
//
//

import Foundation
import CoreData

extension Character {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Character> {
        return NSFetchRequest<Character>(entityName: "Character")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var classes: String?
    @NSManaged public var race: String?

}

extension Character: Identifiable {

}
