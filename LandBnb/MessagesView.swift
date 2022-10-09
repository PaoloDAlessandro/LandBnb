//
//  MessagesView.swift
//  LandBnb
//
//  Created by Paolo D'Alessandro on 13/07/1401 AP.
//

import SwiftUI

private struct User: Identifiable {
    let username: String
    let userImage: String
    let messages: [String]
    var id: String { username }
}

private let users: [User] = [
    User(username: "Alessandro", userImage: "aledele", messages: ["Ciao! Piacere Martina"]),
    User(username: "Paolo", userImage: "paolo", messages: ["Ti aspettiamo il 15 agosto"])
]

struct MessagesView: View {
    
    var users_message = ["Erick", "Martin", "Francesca", "Roberto"]
    var messages = ["L'appartamento viene...", "Ti aspettiamo il 15 agosto", "Ciao! Piacere Manuel", "nana"]
    
    init() {
       UITableView.appearance().separatorStyle = .none
       UITableViewCell.appearance().backgroundColor = .white
       UITableView.appearance().backgroundColor = .white
    }
    
    var body: some View {
        
        VStack() {
            Text("Messages")
            List {
                ForEach(users) { user in
                    UserRow(username: user.username, userImage: user.userImage, message: user.messages[0])
                        .listRowBackground(Color.lightgray)
                }
            }
        }
    }
}

struct UserRow: View {
    var username: String
    var userImage: String
    var message: String
    var body: some View {
        HStack {
            Image(userImage)
                .resizable()
                .frame(width: 40, height: 40)
                .scaledToFit()
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(username)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.darkblue)
                Text(message)
                    .font(.body)
                    .foregroundColor(.gray)
                    
            }
            Spacer()
            Image(systemName: "circle.fill")
                .foregroundColor(.green)
            
        }
        .padding([.top, .bottom], 18)
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
