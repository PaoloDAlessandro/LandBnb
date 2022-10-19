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
    let messages: [Message]
    var id: String { username }
}

private let users: [User] = [
    User(username: "Alessandro", userImage: "aledele", messages: [Message(username: "Alessandro", message: "Ciao Paolo, piacere Alessandro!", date: Date()), Message(username: "myself", message: "Ciao Alessandro!", date: Date())]),
    User(username: "Paolo", userImage: "paolo", messages: [Message(username: "Paolo", message: "Ciao Fabrizio!", date: Date()), Message(username: "Paolo", message: "Ti ho ì nostri prezzi", date: Date()), Message(username: "myself", message: "Ok, grazie!", date: Date())]),

]

struct MessagesView: View {
    
    var users_message = ["Erick", "Martin", "Francesca", "Roberto"]
    var messages = ["L'appartamento viene...", "Ti aspettiamo il 15 agosto", "Ciao! Piacere Manuel", "nana"]
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = UIColor(Color("bg"))
        UITableView.appearance().backgroundColor = UIColor(Color("bg"))
    }
    
    var body: some View {
        
        VStack() {
            Text("Messages")
            NavigationView {
                List {
                    ForEach(users) { user in
                        UserRow(username: user.username, userImage: user.userImage, messages: user.messages)
                            .listRowBackground(Color("boxBg"))
                    }
                }
            }
        }
    }
    
    struct UserRow: View {
        var username: String
        var userImage: String
        var messages: [Message]
        var body: some View {
            NavigationLink(destination: chatView(messages: messages)) {
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
                            .foregroundColor(Color("textColor"))
                        Text(messages[0].message)
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
    }
    
    struct MessagesView_Previews: PreviewProvider {
        static var previews: some View {
            MessagesView()
        }
    }
}
