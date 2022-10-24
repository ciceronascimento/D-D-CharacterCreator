//
//  API-dnd.swift
//  D&D-CharacterCreator
//
//  Created by Cicero Nascimento on 10/10/22.
//

import Foundation

class API {
    /// Função para requisição da API
    /// - Parameter route: Passa a rota escolhida pela função returnURLRequest
    /// - Returns: Retorna os dados da requisição
    static func getData(route: String) async -> APIModel {
        let url = self.returnURLRequest(route: route)
        var urlRequest = URLRequest(url: url)
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

    /// Função que define a rota selecionada
    /// - Parameter route: Rota escolhida
    /// - Returns: Retorna a URL da requisição
    static func returnURLRequest(route: String) -> URL {
        switch route {
        case APIRoute.races.rawValue:
            let baseURL = "https://www.dnd5eapi.co/api/"
            let url = URL(string: baseURL + route)!
            return url
        case APIRoute.classes.rawValue:
            let baseURL = "https://www.dnd5eapi.co/api/"
            let url = URL(string: baseURL + route)!
            return url
        default:
            let baseURL = "https://www.dnd5eapi.co/api/"
            let url = URL(string: baseURL + APIRoute.races.rawValue)!
            return url
        }
    }
}
