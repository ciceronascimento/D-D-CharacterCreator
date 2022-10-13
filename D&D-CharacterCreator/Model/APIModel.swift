//
//  APImodel.swift
//  D&D-CharacterCreator
//
//  Created by Cicero Nascimento on 13/10/22.
//

import Foundation

struct APIModel: Codable {
    let count: Int?
    let results: [Result]?
}

struct Result: Codable {
    let index: String
    let name: String
    let url: String
}
