//
//  CharacterModel.swift
//  D&D-CharacterCreator
//
//  Created by Cicero Nascimento on 10/10/22.
//

import Foundation

class CharacterModel {
    internal init(name: String, race: String, subraces:String , classes: String, subClass: String, skills: [String], spells: String) {
        self.name = name
        self.race = race
        self.subraces = subraces
        self.classes = classes
        self.subClass = subClass
        self.skills = skills
        self.spells = spells
    }
    let name: String
    let race: String
    let subraces: String
    let classes: String
    let subClass: String
    let skills: [String]
    let spells: String
}
