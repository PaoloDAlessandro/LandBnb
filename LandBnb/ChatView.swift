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
    @State var user: User
    
    var body: some View {
        VStack {
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
            Spacer()
                    
            HStack {
                Image(systemName: "paperplane")
                TextField(
                    "",
                    text: $message,
                    onCommit: {
                        /*
                        var currentUser = users.first(where: {$0.username == user.username})
                        currentUser?.messages.append(Message(username: "myself", text: message, date: Date()))
                        print(currentUser?.messages)
                         */
                        message = ""
                    })
                    .background(.gray)
                    .cornerRadius(20)
            }
            .padding(.bottom, 20)
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)

    }
}


