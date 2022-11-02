//
//  ContentView.swift
//  LandBnb
//
//  Created by Paolo D'Alessandro on 12/07/1401 AP.
//

import SwiftUI
import CoreLocation

struct Country: Identifiable {
    let name: String
    let flag: String
    var id: String { name }
    var citiesList: [City]
}

public struct City: Identifiable {
    public var id: UUID
    var name: String
    let housingList: [Housing]
}

public struct Housing: Identifiable {
    public var id: UUID
    var name: String
    var image: String
    var coordinate: CLLocationCoordinate2D
    var location: String
    var description: String
}

struct ContentView: View {
    @State private var search = ""
    @State private var searchOnOver = false
    
    private var countries: [Country] = [Country(name: "Spain", flag: "🇪🇸", citiesList:
                                                    [City(id: UUID(), name: "Siviglia", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 37.364098, longitude: -5.991926),
                                                                     location: "Siviglia, Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Casa Omar", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 37.364098, longitude: -5.991926),
                                                                     location: "Milan, Lombardy, Italy", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "Cartagena", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 37.464098, longitude: -0.991926),
                                                                     location: "Cartagena, Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Casa Omar", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 37.464098, longitude: -0.991926),
                                                                     location: "Cartagena,Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "Madrid", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 40.464098, longitude: -3.791926),
                                                                     location: "Madrid, Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Casa Omar", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 40.464098, longitude: -3.791926),
                                                                     location: "Madrid, Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "Barcellona", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 41.464098, longitude: 2.191926),
                                                                     location: "Barcellona, Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Casa Omar", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 41.464098, longitude: 2.191926),
                                                                     location: "Barcellona, Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "Granada", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 37.464098, longitude: -3.191926),
                                                                     location: "Granada,Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Casa Omar", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 37.464098, longitude: -3.191926),
                                                                     location: "Granada,Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name:"Valencia", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 39.464098, longitude: -0.191926),
                                                                     location: "Valencia,Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Casa Omar", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 39.464098, longitude: -3.191926),
                                                                     location: "Valencia,Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "Pamplona", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 42.464098, longitude: -1.191926),
                                                                     location: "Pampolona,Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Casa Omar", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 42.464098, longitude: -1.191926),
                                                                     location: "Pampolona,Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "Cordoba", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 37.464098, longitude: -4.191926),
                                                                     location: "Cordoba,Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Casa Omar", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 45.464098, longitude: 9.191926),
                                                                     location: "Cordova,Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")])]),
                                        Country(name: "Greek", flag: "🇬🇷", citiesList:
                                                    [City(id: UUID(), name: "Corfù", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 39.464098, longitude: 19.191926),
                                                                     location: "Corfù, Greece", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Casa Omar", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 39.464098, longitude: 19.191926),
                                                                     location: "Corfù, Greece", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "Atene", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 37.464098, longitude: 23.191926),
                                                                     location: "Atene, Greece", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Casa Omar", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 37.464098, longitude: 23.191926),
                                                                     location: "Atene, Greece", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name:"Zante", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 37.464098, longitude: 20.191926),
                                                                     location: "Zante, Greece", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Casa Omar", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 37.464098, longitude: 20.191926),
                                                                     location: "Zante, Greece", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "Olimpia", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 37.464098, longitude: 21.191926),
                                                                     location: "Olimpia,Greece", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Casa Omar", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 37.464098, longitude: 21.191926),
                                                                     location: "Olimpia, Greece", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "Delfi", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 38.464098, longitude: 22.191926),
                                                                     location: "Delfi, Greece", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Casa Omar", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 38.464098, longitude: 21.191926),
                                                                     location: "Delfi,Greece", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name:"Meteora", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 39.464098, longitude: 21.191926),
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-4", coordinate: CLLocationCoordinate2D(latitude: 45.464098, longitude: 9.191926),
                                                                     location: "Milan, Lombardy, Italy", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Casa Omar", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 39.464098, longitude: 21.191926),
                                                                     location: "Milan, Lombardy, Italy", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "La Canea", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 35.464098, longitude: 24.191926),
                                                                     location: "Milan, Lombardy, Italy", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Casa Omar", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 35.464098, longitude: 24.191926),
                                                                     location: "La Canea, Greece", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")])]),
                                        Country(name: "Norway", flag: "🇳🇴", citiesList:
                                                    [City(id: UUID(), name: "Oslo", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 59.464098, longitude: 10.191926),
                                                                     location: "Oslo, Norway", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Casa Omar", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 59.464098, longitude: 10.191926),
                                                                     location: "Oslo, Norway", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "Bergen", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 60.464098, longitude: 5.191926),
                                                                     location: "Bergen, Norway", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Casa Omar", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 60.464098, longitude: 5.191926),
                                                                     location: "Bergen, Norway", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name:"Trondheim", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 63.464098, longitude: 10.191926),
                                                                     location: "Trondheim, Norway", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Casa Omar", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 63.464098, longitude: 10.191926),
                                                                     location: "Trondheim, Norway", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "Alesund", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 62.464098, longitude: 6.191926),
                                                                     location: "Alesund, Norway", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Casa Omar", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 62.464098, longitude: 6.191926),
                                                                     location: "Alesund, Norway", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "Tromsø", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 69.464098, longitude: 18.191926),
                                                                     location: "Tromsø, Norway", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Casa Omar", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 69.464098, longitude: 10.191926),
                                                                     location: "Tromsø, Norway", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")])])]
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = UIColor(Color("bg"))
        UITableView.appearance().backgroundColor = UIColor(Color("bg"))
    }
    
    var body: some View {
        NavigationView {
        ZStack {
            VStack{
                Spacer()
                    .frame(maxHeight: 240)
                VStack {
                    Text("Dove vuoi andare?")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("textColor"))
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color("textColor"))
                        TextField("", text: $search)
                            .foregroundColor(Color("textColor"))
                    }
                    .padding(12)
                    .background(Color("textField"))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(searchOnOver ? .blue.opacity(0.4) : .gray.opacity(0.4), lineWidth: 1))
                    .onTapGesture {
                        searchOnOver.toggle()
                    }
                        List {
                            ForEach(countries) { country in
                                CountryRow(country: country)
                            }
                        }
                        .navigationBarHidden(true)
                }
                .frame(maxHeight: 400)
                .padding([.bottom, .top], 0)
                .padding(.horizontal, 50)
                Spacer()
            }
            }
        }
    }
}

struct CountryRow: View {
    var country: Country
    var body: some View {
        NavigationLink(destination: CitiesView(country: country)) {
            HStack {
                Text(country.flag)
                    .font(.title)
                Text(country.name)
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(Color("textColor"))
            }
            .padding([.top, .bottom], 8)
        }
        .listRowBackground(Color("boxBg"))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
