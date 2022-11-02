//
//  MessagesView.swift
//  LandBnb
//
//  Created by Paolo D'Alessandro on 13/07/1401 AP.
//

import SwiftUI


public struct User: Identifiable {
    let username: String
    let userImage: String
    var messages: [Message]
    let status: Bool
    public var id: String { username }
}

public var users: [User] = [
    User(username: "Alessandro", userImage: "aledele", messages: [Message(id: UUID(), username: "Alessandro", text: "Ciao Marco, piacere Alessandro!", date: Date()), Message(id: UUID(), username: "myself", text: "Ciao Alessandro!", date: Date())], status: true),
    User(username: "Paolo", userImage: "paolo", messages: [Message(id: UUID(), username: "Paolo", text: "Ciao Marco!", date: Date()), Message(id: UUID(), username: "myself", text: "Wella!", date: Date())], status: false),
    User(username: "Simone", userImage: "simone", messages: [Message(id: UUID(), username: "Paolo", text: "Ciao Marco", date: Date()), Message(id: UUID(), username: "Paolo", text: "Ti mando il preventivo per le date scelte", date: Date()), Message(id: UUID(), username: "myself", text: "Ok, grazie!", date: Date())], status: true)
]

struct MessagesView: View {
    

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
                        UserRow(user: user)
                            .listRowBackground(Color("boxBg"))
                    }
                }
            }
        }
    }
    
    struct UserRow: View {
        var user: User
        var body: some View {
            NavigationLink(destination: chatView(user: user)) {
                HStack {
                    Image(user.userImage)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .scaledToFit()
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text(user.username)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("textColor"))
                        Text(user.messages[user.messages.count - 1].text)
                            .font(.body)
                            .foregroundColor(.gray)
                        
                    }
                    Spacer()
                    Image(systemName: "circle.fill")
                        .foregroundColor(user.status ? .green : .gray)
                    
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
