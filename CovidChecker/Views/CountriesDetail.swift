//
//  CountriesDetail.swift
//  CovidChecker
//
//  Created by Baltazar Servin on 28/10/25.
//

import SwiftUI

struct CountriesDetail: View {
    let country: CountryCovidModel
    
    var body: some View {
        VStack (alignment: .leading){
            AsyncImage(url: URL(string: country.countryInfo.flag)) { image in
                image.resizable().scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 270, height: 180)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            Text(country.country)
                .font(.system(size: 50))
                .fontWeight(.bold)
            Text("Cases \(country.cases)")
                .font(.system(size: 20))
                .foregroundStyle(.secondary)
            Text("Deaths \(country.deaths)")
                .font(.system(size: 20))
                .foregroundStyle(.secondary)
            Text("Recovered \(country.recovered)")
                .font(.system(size: 20))
                .foregroundStyle(.secondary)
            Spacer()
        }
        .padding(.vertical, 30)
    }
}

#Preview {
    CountriesDetail(country: CountryCovidModel(
        country: "Mexico",
        countryInfo: .init(flag: "https://disease.sh/assets/img/flags/mx.png"),
        cases: 12345,
        deaths: 200,
        recovered: 12000
    ))
}
