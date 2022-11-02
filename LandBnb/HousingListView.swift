//
//  HousingListView.swift
//  LandBnb
//
//  Created by Paolo D'Alessandro on 02/11/22.
//

import SwiftUI

struct HousingListView: View {
    @State var city: City
    var body: some View {
        VStack {
                List {
                    ForEach(city.housingList) { housing in
                        HousingRow(housing: housing)
                    }
                }
        }
    }
}

struct HousingRow: View {
    var housing: Housing
    var body: some View {
            NavigationLink(destination: ProductView(housing: housing)) {
                HStack {
                    Image("madrid")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .scaledToFit()
                        .clipShape(Circle())
                    Text(housing.name)
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
 struct HousingListView: PreviewProvider {
 static var previews: some View {
 HousingListView()
 }
 }
 */

