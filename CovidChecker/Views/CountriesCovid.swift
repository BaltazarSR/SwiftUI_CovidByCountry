//
//  CountriesCovid.swift
//  CovidChecker
//
//  Created by Baltazar Servin on 28/10/25.
//

import SwiftUI
import Combine

struct CountriesCovidView: View {
    @StateObject var covidController: CountriesCovidController = CountriesCovidController()
    var body: some View {
        NavigationStack {
            Group {
                if covidController.isLoading {
                    ProgressView("Loading…")
                } else if let msg = covidController.errorMessage {
                    Text(msg).foregroundStyle(.red)
                } else if covidController.covidCountries.isEmpty {
                    Text("No data")
                } else {
                    List {
                        ForEach(covidController.covidCountries, id: \.country) { country in
                            NavigationLink {
                                CountriesDetail(country: country)
                            } label: {
                                CountriesBanner(country: country)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Covid Tracker")
        }
        .task { await covidController.fetchCovidData() }
    }
}

#Preview {
    CountriesCovidView()
}
