//
//  CountriesCovid.swift
//  CovidChecker
//
//  Created by Baltazar Servin on 28/10/25.
//

import Foundation

struct CountryCovidModel: Decodable {
    let country: String
    let countryInfo: CountryInfo
    struct CountryInfo: Decodable {
        let flag: String
    }
    let cases: Int
    let deaths: Int
    let recovered: Int
}

