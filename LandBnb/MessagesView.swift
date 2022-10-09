//
//  MessagesView.swift
//  LandBnb
//
//  Created by Paolo D'Alessandro on 13/07/1401 AP.
//

import SwiftUI

struct MessagesView: View {
    var users_message = ["Erick", "Martin", "Francesca", "Roberto"]
    var messages = ["L'appartamento viene...", "Ti aspettiamo il 15 agosto", "Ciao! Piacere Manuel", "nana"]
    var body: some View {
        
        List(users_message, id: \.self) { datum in
            UserRow(content: datum, message: messages[users_message.firstIndex(of: datum) ?? 0])
        }
    }
}

struct UserRow: View {
    var content: String
    var message: String
    var body: some View {
        HStack {
            Image("user1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 70, height: 70)
            VStack(alignment: .leading) {
                Text(content)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(message)
                    .font(.body)
                    .foregroundColor(.gray)
                    
            }
            Spacer()
            Image(systemName: "circle.fill")
                .foregroundColor(.green)
            
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
