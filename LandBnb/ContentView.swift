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
                                                             Housing(id: UUID(), name: "Villa with garden", image: "House-2", coordinate: CLLocationCoordinate2D(latitude: 37.364098, longitude: -5.991926),
                                                                     location: "Siviglia, Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "Cartagena", housingList:
                                                            [Housing(id: UUID(), name: "Amazing House with indoor pool", image: "House-4", coordinate: CLLocationCoordinate2D(latitude: 37.61679847251166, longitude: -0.9895374837263997),
                                                                     location: "Cartagena, Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Beatiful house with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 37.61679847251166, longitude: -0.9895374837263997),
                                                                     location: "Cartagena,Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "Madrid", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 40.425848609721214, longitude: -3.704262972947638),
                                                                     location: "Madrid, Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Amazing apartment", image: "House-6", coordinate: CLLocationCoordinate2D(latitude: 40.425848609721214, longitude: -3.704262972947638),
                                                                     location: "Madrid, Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "Barcellona", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 41.388243057567244, longitude: 2.163634102748796),
                                                                     location: "Barcellona, Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Villa San Moriz with garden", image: "House-4", coordinate: CLLocationCoordinate2D(latitude: 41.388243057567244, longitude: 2.163634102748796),
                                                                     location: "Barcellona, Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "Granada", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-2", coordinate: CLLocationCoordinate2D(latitude: 37.17751264281902, longitude: -3.5980683189786737),
                                                                     location: "Granada,Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Villa Montino with pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 37.17751264281902, longitude: -3.5980683189786737),
                                                                     location: "Granada,Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name:"Valencia", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-4", coordinate: CLLocationCoordinate2D(latitude: 39.472213437745246, longitude: -0.37375186217634165),
                                                                     location: "Valencia,Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Amazing house with view", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 39.472213437745246, longitude: -0.37375186217634165),
                                                                     location: "Valencia,Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "Pamplona", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-2", coordinate: CLLocationCoordinate2D(latitude: 42.81425359611771, longitude: -1.6463309889734075),
                                                                     location: "Pampolona,Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Amazing villa with skyline view", image: "House-4", coordinate: CLLocationCoordinate2D(latitude: 42.81425359611771, longitude: -1.6463309889734075),
                                                                     location: "Pampolona,Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "Cordoba", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 37.888626269279726, longitude: -4.780702623134875),
                                                                     location: "Cordoba,Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Villa Omar with outdoor pool", image: "House-2", coordinate: CLLocationCoordinate2D(latitude: 37.888626269279726, longitude: -4.780702623134875),
                                                                     location: "Cordoba,Spain", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")])]),
                                        Country(name: "Greek", flag: "🇬🇷", citiesList:
                                                    [City(id: UUID(), name: "Corfù", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 39.62454304387258, longitude: 19.921588083029647),
                                                                     location: "Corfù, Greece", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Villa Omar in Corfù", image: "House-2", coordinate: CLLocationCoordinate2D(latitude: 39.62454304387258, longitude: 19.921588083029647),
                                                                     location: "Corfù, Greece", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "Atene", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-4", coordinate: CLLocationCoordinate2D(latitude: 37.98485641353042, longitude: 23.728033887704026),
                                                                     location: "Atene, Greece", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Amazing Villa with outdoor pool", image: "House-6", coordinate: CLLocationCoordinate2D(latitude: 37.98485641353042, longitude: 23.728033887704026),
                                                                     location: "Atene, Greece", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name:"Zante", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-4", coordinate: CLLocationCoordinate2D(latitude: 37.78517383001726, longitude: 20.899824009226986),
                                                                     location: "Zante, Greece", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Casa Omar", image: "House-2", coordinate: CLLocationCoordinate2D(latitude: 37.78517383001726, longitude: 20.899824009226986),
                                                                     location: "Zante, Greece", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "Olimpia", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 37.64545746816683, longitude: 21.62461597840706),
                                                                     location: "Olimpia,Greece", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Beutiful villa with view", image: "House-2", coordinate: CLLocationCoordinate2D(latitude: 37.64545746816683, longitude: 21.62461597840706),
                                                                     location: "Olimpia, Greece", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "Delfi", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 38.48264765905335, longitude: 22.50222629823219),
                                                                     location: "Delfi, Greece", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Villa Fulgencio", image: "House-2", coordinate: CLLocationCoordinate2D(latitude: 38.48264765905335, longitude: 22.50222629823219),
                                                                     location: "Delfi,Greece", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name:"Meteora", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-2", coordinate: CLLocationCoordinate2D(latitude: 21.630820783335928, longitude: 22.191926),
                                                                     location: "Meteora, Greece", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Amazing house with garden", image: "House-1", coordinate: CLLocationCoordinate2D(latitude: 39.72171784886767, longitude: 21.630820783335928),
                                                                     location: "Meteora,Greece", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "La Canea", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with outdoor pool", image: "House-6", coordinate: CLLocationCoordinate2D(latitude:35.51364435271859, longitude: 24.017358442966728),
                                                                     location: "La Canea, Greece", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Villa Stefani", image: "House-4", coordinate: CLLocationCoordinate2D(latitude: 35.51364435271859, longitude: 24.017358442966728),
                                                                     location: "La Canea, Greece", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")])]),
                                        Country(name: "Norway", flag: "🇳🇴", citiesList:
                                                    [City(id: UUID(), name: "Oslo", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with indoor pool", image: "House-7", coordinate: CLLocationCoordinate2D(latitude: 59.91994660531434, longitude: 10.748719400401155),
                                                                     location: "Oslo, Norway", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Villa with spa", image: "House-8", coordinate: CLLocationCoordinate2D(latitude: 59.91994660531434, longitude: 10.748719400401155),
                                                                     location: "Oslo, Norway", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "Bergen", housingList:
                                                            [Housing(id: UUID(), name: "Amazing House with garden", image: "House-9", coordinate: CLLocationCoordinate2D(latitude: 60.40018298034893, longitude: 5.315168804792219),
                                                                     location: "Bergen, Norway", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Chalet Stefani", image: "House-11", coordinate: CLLocationCoordinate2D(latitude: 60.40018298034893, longitude: 5.315168804792219),
                                                                     location: "Bergen, Norway", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name:"Trondheim", housingList:
                                                            [Housing(id: UUID(), name: "Elegant House with indoor pool", image: "House-9", coordinate: CLLocationCoordinate2D(latitude: 63.43206205782819, longitude: 10.394398936042487),
                                                                     location: "Trondheim, Norway", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Villa Tate", image: "House-11", coordinate: CLLocationCoordinate2D(latitude: 63.43206205782819, longitude: 10.394398936042487),
                                                                     location: "Trondheim, Norway", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "Alesund", housingList:
                                                            [Housing(id: UUID(), name: "House with garden", image: "House-7", coordinate: CLLocationCoordinate2D(latitude: 62.475025127843615, longitude: 6.147376306129864),
                                                                     location: "Alesund, Norway", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Villa with spa", image: "House-11", coordinate: CLLocationCoordinate2D(latitude: 62.475025127843615, longitude: 6.147376306129864),
                                                                     location: "Alesund, Norway", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties.")]),
                                                     City(id: UUID(), name: "Tromsø", housingList:
                                                            [Housing(id: UUID(), name: "Beatiful House with indoor spa", image: "House-8", coordinate: CLLocationCoordinate2D(latitude: 69.65133327198421, longitude: 18.955246870752042),
                                                                     location: "Tromsø, Norway", description: "Quant self-catering cabin gently nestled into the historic family-run Dry Island. 'Otter Cabin' is fitted out to a high standard with a double bedroom, shower room, open plan kitchen and living room and its own hot tub and decking area. This is a traditional self-catering unit. Kitchen basics and linens are provided. High-speed wifi is available. Unfortunately, the cabin is inaccessible to those with mobility difficulties."),
                                                             Housing(id: UUID(), name: "Villa Dalex", image: "House-11", coordinate: CLLocationCoordinate2D(latitude: 69.65133327198421, longitude: 18.955246870752042),
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
                            ForEach(search == "" ? countries : countries.filter {$0.name.localizedCaseInsensitiveContains(search)}) { country in
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
