//
//  SoundboardItemViewViewModel.swift
//  Kalamni
//
//  Created by csuftitan on 2/21/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class SoundboardItemViewViewModel: ObservableObject {
    init() {}

    func toggleIsFavorite(item: SoundboardItem) {
        var itemCopy = item
        itemCopy.setFavorite(!item.isFavorite)
    }
    
//    func toggleIsFavorite(item: SoundboardItem) {
//        var itemCopy = item
//        itemCopy.setFavorite(!item.isFavorite)
//        
//        guard let uid = Auth.auth().currentUser?.uid else {
//            return
//        }
//        
//        let db = Firestore.firestore()
//        db.collection("users")
//            .document(uid)
//            .collection("favorites")
//            .document(itemCopy.id)
//            .setData(itemCopy.asDictionary())
//    }
}
