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
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.lightgray)
            .cornerRadius(20)
            .padding([.bottom, .top], -10)
            .padding(.horizontal, 20)
            
            VStack {
                HStack {
                    Image("logo")
                        .padding()
                        .frame(maxHeight: 50)
                }
                .background(Color.gray.opacity(0.3))
                .cornerRadius(14)
                
                Spacer()
                    .frame(maxHeight: 280)
                Text("Dove vuoi andare?")
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("", text: $search)
                }
                .padding(12)
                .background(Color.white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(searchOnOver ? .blue.opacity(0.4) : .gray.opacity(0.4), lineWidth: 1))
                .onTapGesture {
                    searchOnOver.toggle()
                }
                Spacer()
                TextField("", text: $search)

            }
            
            .padding([.bottom, .top], 0)
            .padding(.horizontal, 50)

        }.background(
            Image("surface")
                
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
