//
//  ProfileView.swift
//  Kalamni
//
//  Created by csuftitan on 2/21/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    @State private var selectedLanguage: Language = .english
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "Profile", subtitle: "", angle: 10, background: .indigo)

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
            .foregroundColor(.indigo)
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
        Button("Log Out") {
            viewModel.logOut()
            SoundboardViewViewModel.updateCurrentLanguage(language: nil)
        }
        .tint(.red)
        .padding()
        
        Spacer()
        Picker("Language", selection: $selectedLanguage) {
            ForEach(Language.allCases) { language in
                Text(language.rawValue.capitalized)
            }.onChange(of:selectedLanguage) {
                let lang = selectedLanguage == .english ? "en-US" : "ar-SA"
                viewModel.toggleLanguage(language: lang)
            }
        }.pickerStyle(.segmented).onAppear {
            selectedLanguage = viewModel.getLanguage()
        }.padding(.top, 50)
    }
}

#Preview {
    ProfileView()
}
