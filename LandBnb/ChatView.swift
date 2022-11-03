//
//  chatView.swift
//  LandBnb
//
//  Created by Paolo D'Alessandro on 19/10/22.
//

import SwiftUI

public struct Message: Identifiable {
    public var id:UUID?
    let username: String
    let text: String
    let date: Date
}
    
struct chatView: View {
        
    @State private var message: String = ""
    @Binding var user: User
    
    var body: some View {
        VStack {
            ScrollView {
                    ForEach(user.messages){ message in
                        Text(message.text)
                            .foregroundColor(.white)
                            .padding(14)
                            .background(Color.blue)
                            .cornerRadius(20)
                            .frame(maxWidth: .infinity, alignment: message.username == "myself" ? .trailing : .leading)
                        Spacer()
                            .frame(height: 20)
                    }
            }
        
            Spacer()
                    
            VStack(alignment:.center) {
                HStack {
                    TextField(
                        "",
                        text: $message,
                        onCommit: {
                            if(message != "") {
                                user.messages.append(Message(id: UUID(), username: "myself", text: message, date: Date()))
                            }
                            message = ""
                        })
                    Button {
                        if(message != "") {
                            user.messages.append(Message(id: UUID(), username: "myself", text: message, date: Date()))
                        }
                        message = ""
                    } label: {
                        Image(systemName: "paperplane")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(.blue)
                            .clipShape(Circle())
                    }
                }
                .padding(6)
                .padding(.leading, 12)
                .overlay(
                    RoundedRectangle(cornerRadius: 80)
                        .stroke(.blue)
                )
                .frame(height: 80)
            }
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}


