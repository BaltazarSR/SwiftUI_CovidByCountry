//
//  CovidController.swift
//  CovidChecker
//
//  Created by Baltazar Servin on 28/10/25.
//

import Foundation
import Combine

class CountriesCovidController: ObservableObject {
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    @Published var covidCountries: [CountryCovidModel] = []
    
    private let covidAPI: CovidAPI = CovidAPI()
    
    private func message(for error: Error) -> String {
        switch error as? APIError {
            case .invalidURL?:      return "Invalid location."
            case .badStatus?:       return "Server error. Try again."
            case .decodingError?:   return "Unexpected data."
            default:                return "Something went wrong."
        }
    }
    
    func fetchCovidData() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        
        do {
            let res = try await covidAPI.getCovidCountries()
            covidCountries = res
        } catch {
            errorMessage = message(for: error)
        }
    }
}
