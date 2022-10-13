//
//  API-dnd.swift
//  D&D-CharacterCreator
//
//  Created by Cicero Nascimento on 10/10/22.
//

import Foundation

class API {
    let route = "races"
    static func getData() async -> APIModel {
        var urlRequest = URLRequest(url: URL(string: "https://www.dnd5eapi.co/api/races")!)
        urlRequest.httpMethod = "GET"

        do {
            let(data, _) = try await URLSession.shared.data(for: urlRequest)
            let getDataDecoded = try JSONDecoder().decode(APIModel.self, from: data)
            return getDataDecoded
        } catch {
            print(error)
        }
        return APIModel(count: 1, results: [Result(index: "", name: "", url: "")])
    }
}
