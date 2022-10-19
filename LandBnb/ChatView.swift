//
//  chatView.swift
//  LandBnb
//
//  Created by Paolo D'Alessandro on 19/10/22.
//

import SwiftUI

public struct Message: Identifiable {
    public var id: String { username }
    let username: String
    let message: String
    let date: Date
}

struct chatView: View {
    
    let messages: [Message]
    
    var body: some View {
        VStack {
            ForEach(messages){ message in
                Text(message.message)
                    .foregroundColor(.white)
                    .padding(14)
                    .background(Color.blue)
                    .cornerRadius(20)
                    .frame(maxWidth: .infinity, alignment: message.username == "myself" ? .trailing : .leading)
                Spacer()
                    .frame(height: 20)
            }
            Spacer()
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)

    }
}


struct chatView_Previews: PreviewProvider {
    static var previews: some View {
        chatView(messages: [Message(username: "Alessandro", message: "Ciao Paolo, piacere Alessandro!", date: Date())])
    }
}
