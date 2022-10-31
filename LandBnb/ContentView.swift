//
//  ContentView.swift
//  LandBnb
//
//  Created by Paolo D'Alessandro on 12/07/1401 AP.
//

import SwiftUI

struct ContentView: View {
    @State private var search = ""
    @State private var searchOnOver = false
    
    var body: some View {
        ZStack {
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
            }
            .removeFocusOnTap()
            .padding([.bottom, .top], 0)
            .padding(.horizontal, 50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
