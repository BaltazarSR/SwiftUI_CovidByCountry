//
//  CountriesBanner.swift
//  CovidChecker
//
//  Created by Baltazar Servin on 28/10/25.
//

import SwiftUI

struct CountriesBanner: View {
    let country: CountryCovidModel

    var body: some View {
        HStack(spacing: 12) {
            // flag
            AsyncImage(url: URL(string: country.countryInfo.flag)) { image in
                image.resizable().scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 45, height: 30)
            .clipShape(RoundedRectangle(cornerRadius: 4))

            VStack(alignment: .leading) {
                Text(country.country)
                    .font(.headline)
                Text("Cases: \(country.cases)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding(.vertical, 4)
        .padding(.horizontal)
    }
}

#Preview {
    CountriesBanner(country: CountryCovidModel(
        country: "Mexico",
        countryInfo: .init(flag: "https://disease.sh/assets/img/flags/mx.png"),
        cases: 12345,
        deaths: 200,
        recovered: 12000
    ))
}
