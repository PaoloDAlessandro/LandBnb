//
//  CitiesView.swift
//  LandBnb
//
//  Created by Paolo D'Alessandro on 02/11/22.
//

import SwiftUI

struct CitiesView: View {
    @State var country: Country
    var body: some View {
        VStack {
                List {
                    ForEach(country.citiesList) { city in
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
                        .frame(width: 40, height: 40)
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
