//
//  MessageView.swift
//  Kalamni
//
//  Created by csuftitan on 2/21/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct MessageView: View {
    @StateObject var viewModel: MessageViewModel
    @FirestoreQuery var messages: [MessageItem]
    
    init(userID: String) {
        self._messages = FirestoreQuery(collectionPath: "users/\(userID)/messages")
        self._viewModel = StateObject(wrappedValue: MessageViewModel(userID: userID))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(messages.sorted {$0.createdDate > $1.createdDate}) { item in
                    MessageItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                            Button("Reply") {
                                MessageViewModel.replyEmail = item.email
                                viewModel.showingNewItemView = true
                            }.tint(.blue)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Messages")
            .toolbar {
                Button {
                    MessageViewModel.replyEmail = ""
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewMessageView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    MessageView(userID: "kA4Gg7PBLNZm8kBqsVAhCqwACul2")
}




    
//    var body: some View {
//        NavigationView {
//            VStack {
//                HeaderView(title: "Messages", subtitle: "", angle: 10, background: .blue)
//                Image(systemName: "mail")
//                    .imageScale(.large)
//                    .foregroundStyle(.tint)
//                Text("No Messages")
//                Spacer()
//            }
//        }
//        .padding(.bottom, 50)
//    }
