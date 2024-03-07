//
//  ProfileViewViewModel.swift
//  Kalamni
//
//  Created by csuftitan on 2/21/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileViewViewModel: ObservableObject {
    init() {}
    
    @Published var user: User? = nil
    private let en: Language = .english
    private let ar: Language = .arabic
    
    func fetchUser() {
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userID).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    language: data["language"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0
                )
            }
        }
        return
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
    
    func getLanguage() -> Language {
        return user?.language == "en-US" ? en : ar
    }
    
    func toggleLanguage(language: String) {
        if (language == user?.language) {
            return
        }
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let update = Firestore.firestore().collection("users").document(uid)
        update.updateData(["language": language])
        fetchUser()
    }
}
