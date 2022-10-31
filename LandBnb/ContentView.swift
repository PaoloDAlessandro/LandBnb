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
}

struct ContentView: View {
    @State private var search = ""
    @State private var searchOnOver = false
    
    private var countries: [Country] = [Country(name: "Spain", flag: "🇪🇸"), Country(name: "Greek", flag: "🇬🇷"), Country(name: "Norway", flag: "🇳🇴")]
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = UIColor(Color("bg"))
        UITableView.appearance().backgroundColor = UIColor(Color("bg"))
    }
    
    var body: some View {
        ZStack {
            VStack{
                Spacer()
                    .frame(maxHeight: 300)
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
                    NavigationView {
                        List {
                            ForEach(countries) {country in
                                NavigationLink(destination: ProductView()) {
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
                        .navigationBarHidden(true)
                    }
                    .padding(.top, 10)
                }
                .removeFocusOnTap()
                .frame(maxHeight: 400)
                .padding([.bottom, .top], 0)
                .padding(.horizontal, 50)
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
