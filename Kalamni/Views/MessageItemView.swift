//
//  MessageItemView.swift
//  Kalamni
//
//  Created by csuftitan on 3/31/24.
//

import SwiftUI

struct MessageItemView: View {
    @StateObject var viewModel = MessageItemViewViewModel()
    
    let item: MessageItem
    
    var body: some View {
        HStack {
            Button {
                viewModel.toggleIsRead(item: item)
            } label: {
                Image(systemName: item.isRead ? "mail" : "mail.fill").foregroundColor(.blue)
            }

            VStack(alignment: .leading) {
                Text(item.name + " (" + item.email + ")")
                    .font(.footnote)
                Text(item.message)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.createdDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
        }
    }
}

#Preview {
    MessageItemView(item: .init(
        id:"123",
        idSender: "kA4Gg7PBLNZm8kBqsVAhCqwACul2",
        name: "Daniel Camacho",
        email: "danielcamacho@csu.fullerton.edu",
        language: "en-US",
        message: "test message",
        createdDate: Date().timeIntervalSince1970,
        isRead: true
    ))
}
