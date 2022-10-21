//
//  CoreDataMethods.swift
//  D&D-CharacterCreator
//
//  Created by Cicero Nascimento on 20/10/22.
//

import Foundation
import CoreData

class CoreDataMethods {
    func fetchCharacters(context: NSManagedObjectContext) -> [Character] {
        do {
            let characterRequest = Character.fetchRequest() as NSFetchRequest<Character>
            return try context.fetch(characterRequest)
        } catch {
            print("Erro ao dar fetch nos characters")
            print(error)
            return []
        }
    }

    func createCharacter(name: String, race: String, classes: String, context: NSManagedObjectContext) -> Character {
        let newCharacter = Character(context: context)
        newCharacter.name = name
        newCharacter.race = race
        newCharacter.classes = classes
        return newCharacter
    }

    func saveCharacterCoreData(context: NSManagedObjectContext) -> Bool {

        do {
            try context.save()
            return true
        } catch {
            print(error)
        }
        return false
    }

}
