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
            print("Character salvo adicionado com sucesso")
            return true
        } catch {
            print("Error: was not able to add the clothe at core data")
            print(error)
        }
        return false
    }

    func printAllCharacters(context: NSManagedObjectContext) {
        let characters = fetchCharacters(context: context)
        if !characters.isEmpty {
            for character in characters {
                print("name: \(String(describing: character.name)), class: \(String(describing: character.classes)), race: \(String(describing: character.race))")
            }
        } else {
            print("Não há personagens salvos no core data.")
        }
    }
//    func createCharacter(data:)
}
