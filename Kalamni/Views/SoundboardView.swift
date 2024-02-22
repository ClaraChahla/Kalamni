//
//  SoundboardView.swift
//  Kalamni
//
//  Created by csuftitan on 2/21/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct SoundboardView: View {
    @StateObject var viewModel: SoundboardViewViewModel
    @FirestoreQuery var favorites: [SoundboardItem]
    
    init(userID: String) {
        self._favorites = FirestoreQuery(collectionPath: "users/\(userID)/favorites")
        self._viewModel = StateObject(wrappedValue: SoundboardViewViewModel(userID: userID))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "Soundboard", subtitle: "Select a sound to play", angle: 10, background: .green)
                Image(systemName: "cat")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Kalamni")
                VStack {
                    Button("Talk") {
                        viewModel.talk()
                    }
                }
                Spacer()
            }
            .padding(.bottom, 50)
        }
    }
}

#Preview {
    SoundboardView(userID: "0tXHpKc9sVWacjB36D8PFfe3sFz2")
}
