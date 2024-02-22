//
//  ProfileView.swift
//  Kalamni
//
//  Created by csuftitan on 2/21/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()

    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "Profile", subtitle: "", angle: 10, background: .purple)

                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
                Spacer()
            }
            .padding(.bottom, 50)
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width:125, height: 125)
            .padding()
        
        VStack(alignment: .leading) {
            HStack {
                Text("Name:")
                    .bold()
                Text(user.name)
            }
            HStack {
                Text("Email:")
                    .bold()
                Text(user.email)
            }
            HStack {
                Text("Member Since:")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }
        .padding()
        
        Button("Log Out") {
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
    }
}

#Preview {
    ProfileView()
}
