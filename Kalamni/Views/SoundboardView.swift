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
//    @FirestoreQuery var favorites: [SoundboardItem]
    
    init(userID: String) {
//        self._favorites = FirestoreQuery(collectionPath: "users/\(userID)/favorites")
        self._viewModel = StateObject(wrappedValue: SoundboardViewViewModel(userID: userID))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "Soundboard", subtitle: "", angle: 10, background: .green)

                
                
                
                Spacer()
            }
            .padding(.bottom, 50)
        }
    }
}

#Preview {
    SoundboardView(userID: "0tXHpKc9sVWacjB36D8PFfe3sFz2")
}



//VStack {
//    Button {
//        viewModel.talk()
//    } label: {
//        SoundboardItemView(item: SoundboardItem(id: "123", image: "img", textEnglish: "Hello World!", textArabic: "Text", isFavorite: false))
//    }
//}
