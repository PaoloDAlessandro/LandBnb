//
//  CitiesView.swift
//  LandBnb
//
//  Created by Paolo D'Alessandro on 02/11/22.
//

import SwiftUI

struct CitiesView: View {
    @State var country: Country
    @State private var search = ""
    var body: some View {
        VStack {
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
                    .stroke(.gray.opacity(0.4), lineWidth: 1))
            .padding(.horizontal, 40)

                List {
                    ForEach(search == "" ? country.citiesList : country.citiesList.filter {$0.name.localizedCaseInsensitiveContains(search)}) { city in
                        CityRow(city: city)
                    }
                }
        }
    }
}

struct CityRow: View {
    var city: City
    var body: some View {
            NavigationLink(destination: HousingListView(city: city)) {
                HStack {
                    Image(city.name)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .scaledToFit()
                        .clipShape(Circle())
                    Text(city.name)
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(Color("textColor"))
                }
                .padding([.top, .bottom], 8)
            }
            .listRowBackground(Color("boxBg"))
        }
}

/*
 struct CitiesView_Previews: PreviewProvider {
 static var previews: some View {
 CitiesView()
 }
 }
 */
