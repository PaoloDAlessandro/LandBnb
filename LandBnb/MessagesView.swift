//
//  MessagesView.swift
//  LandBnb
//
//  Created by Paolo D'Alessandro on 13/07/1401 AP.
//

import SwiftUI

struct MessagesView: View {
    var users_message = ["Erick", "Martin", "Francesca", "Roberto"]
    var body: some View {
        List(users_message, id: \.self) { datum in
            UserRow(content: datum)
            
        }
    }
}

struct UserRow: View {
    var content: String
    var body: some View {
        HStack {
            Image("user1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 60, height: 60)
            Text(content)
            Spacer()
        }
        .font(.title).padding([.top, .bottom])
        
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
