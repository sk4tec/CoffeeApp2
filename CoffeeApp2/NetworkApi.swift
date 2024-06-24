//
//  NetworkApi.swift
//  CoffeeApp2
//
//  Created by Sunjay Kalsi on 23/06/2024.
//

import Foundation

class NetworkApi {
    static func getCoffee() async throws -> [CoffeeData] {
        let endpoint = "https://api.sampleapis.com/coffee/hot"

        // make URL
        guard let url = URL(string: endpoint) else { throw Error.invalidURLError }

        // make request
        let (data, response) = try await URLSession.shared.data(from: url)

        // cast as get request
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw Error.networkError }

        // get response
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode([CoffeeData].self, from: data)
        } catch {
            throw Error.decodeError
        }
    }
}

enum Error: Swift.Error {
    case decodeError
    case invalidURLError
    case networkError
    case unknownError
}
