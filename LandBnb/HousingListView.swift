//
//  HousingListView.swift
//  LandBnb
//
//  Created by Paolo D'Alessandro on 02/11/22.
//

import SwiftUI

struct HousingListView: View {
    @State var city: City
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
                    ForEach(search == "" ? city.housingList : city.housingList.filter {$0.name.localizedCaseInsensitiveContains(search)}) { housing in
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
                    Image(housing.image)
                        .resizable()
                        .frame(width: 50, height: 50)
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

