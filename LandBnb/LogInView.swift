//
//  LogInView.swift
//  LandBnb
//
//  Created by Paolo D'Alessandro on 12/07/1401 AP.
//

import SwiftUI

//
//  ContentView.swift
//  LandBnb
//
//  Created by Paolo D'Alessandro on 12/07/1401 AP.
//

import SwiftUI

struct LogInView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var emailOnOver = false
    @State private var passwordOnOver = false

    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .frame(width: .infinity, height: .infinity)
                    .opacity(0.001)
                    .layoutPriority(-1)
                    .onTapGesture {
                        emailOnOver = false
                        passwordOnOver = false
                    }
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
                    .frame(maxHeight: 130)
                Text("Accedi")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 24)
                VStack {
                    VStack(alignment: .leading) {
                        Text("Email")
                            .fontWeight(.semibold)
                        TextField("", text: $email)
                            .padding(12)
                            .background(.white)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(emailOnOver ? .blue.opacity(0.4) : .gray.opacity(0.4), lineWidth: 1))
                            .onTapGesture {
                                emailOnOver.toggle()
                            }
                    }
                    .padding(.bottom, 10)
                    .padding([.leading, .trailing], 26)
                    .padding(.top, 45)

                    
                    VStack(alignment: .leading) {
                        Text("Password")
                            .fontWeight(.semibold)
                        TextField("", text: $password)
                            .padding(12)
                            .background(.white)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(passwordOnOver ? .blue.opacity(0.4) : .gray.opacity(0.4), lineWidth: 1))
                            .onTapGesture {
                                passwordOnOver.toggle()
                            }
                    }
                    .padding(.top, 18)
                    .padding([.leading, .trailing], 26)
                    .padding(.bottom, 24)

                    HStack {
                        Button(action: {})
                        {
                            Text("Log-in")
                        }
                        .padding([.bottom, .top], 16)
                        .padding([.leading, .trailing], 28)
                        .foregroundColor(.white)
                        .background(Color.darkblue)
                        .cornerRadius(14)
                    }
                    .padding(.bottom, 40)
                    
                }
                .background(.white)
                .cornerRadius(40)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(.gray.opacity(0.6), lineWidth: 1))
                .shadow(color: Color.black.opacity(0.1), radius: 5)
                
                Spacer()
                    .frame()
                
                HStack {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Esplora")
                            .font(.footnote)
                    }
                    .padding(.horizontal, 6)
                    
                    VStack {
                        Image(systemName: "heart")
                        Text("Preferiti")
                            .font(.footnote)
                    }
                    .padding(.horizontal, 6)
                    
                    VStack {
                        Image(systemName: "safari")
                        Text("Viaggi")
                            .font(.footnote)
                    }
                    .padding(.horizontal, 6)
                    
                    VStack {
                        Image(systemName: "message")
                        Text("Messaggi")
                            .font(.footnote)
                    }
                    .padding(.horizontal, 6)
                    
                    VStack {
                        Image(systemName: "person")
                        Text("Profilo")
                            .font(.footnote)
                    }
                    .padding(.horizontal, 6)
                    
                }
                .frame(maxWidth: .infinity)
                .padding([.top, .bottom], 18)
                .background(Color.white)
                .cornerRadius(40)
            }
            .padding([.bottom, .top], 0)
            .padding(.horizontal, 20)

        }.background(
            Image("surface")
                .blur(radius: 2)
                
        )
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}

