//
//  CoreDataMethods.swift
//  D&D-CharacterCreator
//
//  Created by Cicero Nascimento on 20/10/22.
//

import Foundation
import CoreData

class CoreDataMethods {
    /// Função para buscar no banco
    /// - Parameter context: Contexto do CoreData
    /// - Returns: Um array do tipo Character
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

    /// Função para criar um novo character
    /// - Parameters:
    ///   - name: Nome do char
    ///   - race: Raça escolhida
    ///   - classes: Classe escolhida
    ///   - context: context do CoreData
    /// - Returns: Retorna uma instancia do tipo Character
    func createCharacter(name: String, race: String, classes: String, context: NSManagedObjectContext) -> Character {
        let newCharacter = Character(context: context)
        newCharacter.name = name
        newCharacter.race = race
        newCharacter.classes = classes
        return newCharacter
    }

    /// Salva o char no CoreData
    /// - Parameter context: contexto do core data
    /// - Returns: Booleano
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
