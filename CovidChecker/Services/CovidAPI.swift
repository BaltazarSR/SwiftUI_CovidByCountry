//
//  CovidAPI.swift
//  CovidChecker
//
//  Created by Baltazar Servin on 28/10/25.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case badStatus
    case decodingError
}

struct CovidAPI {
    func getCovidCountries() async throws -> [CountryCovidModel] {
        let urlString = "https://disease.sh/v3/covid-19/countries"
        guard let url = URL(string: urlString) else { throw APIError.invalidURL }
        
        let (data, resp) = try await URLSession.shared.data(from: url)
        guard (resp as? HTTPURLResponse)?.statusCode == 200 else { throw APIError.badStatus }
        do {
            return try JSONDecoder().decode([CountryCovidModel].self, from: data)
        } catch {
            throw APIError.decodingError
        }
    }
}
