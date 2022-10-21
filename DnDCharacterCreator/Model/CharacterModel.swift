//
//  CharacterModel.swift
//  D&D-CharacterCreator
//
//  Created by Cicero Nascimento on 10/10/22.
//

import Foundation

class CharacterModel: Codable {
    let name: String?
    let race: String
    let languages: String
    let classes: String

    internal init(name: String? = nil, race: String, languages: String, classes: String) {
        self.name = name
        self.race = race
        self.languages = languages
        self.classes = classes
    }
}
