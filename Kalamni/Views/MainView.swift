//
//  ContentView.swift
//  Kalamni
//
//  Created by csuftitan on 2/17/24.
//

import SwiftUI

struct MainView: View {
    @Environment(\.modelContext) var context
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            SoundboardView(userID: viewModel.currentUserId)
                .tabItem {
                    Label("Soundboard", systemImage: "speaker.wave.3")
                }
            MessageView()
                .tabItem {
                    Label("Messages", systemImage: "bubble")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
