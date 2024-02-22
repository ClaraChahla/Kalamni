//
//  MessageView.swift
//  Kalamni
//
//  Created by csuftitan on 2/21/24.
//

import SwiftUI

struct MessageView: View {
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
    MessageView()
}
