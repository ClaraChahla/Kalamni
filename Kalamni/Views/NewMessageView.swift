//
//  NewMessageView.swift
//  Kalamni
//
//  Created by csuftitan on 3/31/24.
//

import SwiftUI

struct NewMessageView: View {
    @StateObject var viewModel = NewMessageViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Message").font(.system(size: 32)).bold().padding(.top, 20)
            
            Form {
                // Title
                TextField("Recipient", text: $viewModel.idRecipient).textFieldStyle(DefaultTextFieldStyle())
                
                // Due Date
                TextField("Message", text: $viewModel.message).textFieldStyle(DefaultTextFieldStyle())
                
                // Button
                TLButton(title: "Send", background: .pink) {
                        viewModel.send()
                        newItemPresented = false
                }
                .padding()
            }
        }
    }
}

#Preview {
    NewMessageView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
