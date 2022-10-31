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
    @FocusState private var isFocused: Bool

    var body: some View {
            VStack {
                VStack {
                    Text("Accedi")
                        .font(.title)
                        .foregroundColor(Color("textColor"))
                        .fontWeight(.bold)
                        .padding(.top, 30)
                        .padding(.bottom, 0)
                    VStack(alignment: .leading) {
                        Text("Email")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("textColor"))
                        TextField("", text: $email)
                            .focused($isFocused)
                            .foregroundColor(Color("subTextColor"))
                            .padding(12)
                            .background(Color("textField"))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(emailOnOver ? .blue.opacity(0.4) : .gray.opacity(0.4), lineWidth: 1))
                            .onTapGesture {
                                emailOnOver.toggle()
                                passwordOnOver = false
                            }
                    }
                    .padding(.bottom, 10)
                    .padding([.leading, .trailing], 26)
                    .padding(.top, 20)

                    VStack(alignment: .leading) {
                        Text("Password")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("textColor"))
                        TextField("", text: $password)
                            .focused($isFocused)
                            .foregroundColor(Color("textColor"))
                            .padding(12)
                            .background(Color("textField"))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(passwordOnOver ? .blue.opacity(0.4) : .gray.opacity(0.4), lineWidth: 1))
                            .onTapGesture {
                                passwordOnOver.toggle()
                                emailOnOver = false
                            }
                    }
                    .padding(.top, 18)
                    .padding([.leading, .trailing], 26)
                    .padding(.bottom, 24)

                    HStack {
                        Button(action: {isFocused = false})
                        {
                            Text("Log-in")
                                .foregroundColor(.white)
                        }
                        .padding([.bottom, .top], 16)
                        .padding([.leading, .trailing], 28)
                        .foregroundColor(.white)
                        .background(Color("button"))
                        .cornerRadius(14)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.gray.opacity(0.8), lineWidth: 1)
                        )
                    }
                    .padding(.bottom, 40)
                }
                .background(Color("boxBg"))
                .cornerRadius(20)
            }
            .removeFocusOnTap()
            .padding([.bottom, .top], 0)
            .padding(.horizontal, 20)
            .ignoresSafeArea(edges: .bottom)
        }
    }

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}

