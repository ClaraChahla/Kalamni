//
//  MessageView.swift
//  Kalamni
//
//  Created by csuftitan on 2/21/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct MessageView: View {
    @StateObject var viewModel: MessageViewViewModel
    @FirestoreQuery var messages: [Message]
        
    init(userID: String) {
        self._messages = FirestoreQuery(collectionPath: "users/\(userID)/messages")
        self._viewModel = StateObject(wrappedValue: MessageViewViewModel(userID: userID))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "Messages", subtitle: "", angle: 10, background: .blue)
                Image(systemName: "mail")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("No Messages")
                Spacer()
            }
        }
        .padding(.bottom, 50)
    }
}

#Preview {
    MessageView(userID: "0tXHpKc9sVWacjB36D8PFfe3sFz2")
}
