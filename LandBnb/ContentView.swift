//
//  ContentView.swift
//  LandBnb
//
//  Created by Paolo D'Alessandro on 12/07/1401 AP.
//

import SwiftUI

struct Country: Identifiable {
    let name: String
    let flag: String
    var id: String { name }
    var citiesList: [City]
}

public struct City: Identifiable {
    public var id: UUID
    var name: String
    //let housingList: [Housing]
}

public struct Housing: Identifiable {
    public var id: UUID
    var name: String
    var location: String
}

struct ContentView: View {
    @State private var search = ""
    @State private var searchOnOver = false
    
    private var countries: [Country] = [Country(name: "Spain", flag: "🇪🇸", citiesList: [City(id: UUID(), name: "Siviglia"), City(id: UUID(), name: "Cartagena"), City(id: UUID(), name: "Madrid"), City(id: UUID(), name: "Barcellona"), City(id: UUID(), name: "Ibiza"), City(id: UUID(), name: "Granada"), City(id: UUID(), name:"Valencia"), City(id: UUID(), name: "Pamplona"), City(id: UUID(), name: "Cordoba"), City(id: UUID(), name: "Salamanca")]), Country(name: "Greek", flag: "🇬🇷", citiesList: [City(id: UUID(), name: "Corfù"), City(id: UUID(), name: "Atene"), City(id: UUID(), name:"Zante"), City(id: UUID(), name: "Olimpia"), City(id: UUID(), name: "Delfi"), City(id: UUID(), name:"Meteora"), City(id: UUID(), name: "La Canea")]), Country(name: "Norway", flag: "🇳🇴", citiesList: [City(id: UUID(), name: "Oslo"), City(id: UUID(), name: "Bergen"), City(id: UUID(), name:"Trondheim"), City(id: UUID(), name: "Alesund"), City(id: UUID(), name: "Tromsø")])]
    
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
