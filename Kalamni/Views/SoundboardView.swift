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
    var test = ["test1", "test2", "test3", "test4", "test5", "test6"]
    let columns = [GridItem(.fixed(50)), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    init(userID: String) {
//        self._favorites = FirestoreQuery(collectionPath: "users/\(userID)/favorites")
        self._viewModel = StateObject(wrappedValue: SoundboardViewViewModel(userID: userID))
    }
    
    private func emoji(_ value: Int) -> String {
            guard let scalar = UnicodeScalar(value) else { return "?" }
            return String(Character(scalar))
        }
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "Soundboard", subtitle: "", angle: 10, background: .green)
                
                
                ScrollView(.horizontal) {
                    LazyHGrid(rows: columns) {
                        ForEach(0x1f600...0x1f679, id: \.self) { value in
                            Text(String(format: "%x", value))
                            Text(emoji(value))
                                .font(.largeTitle)
                        }
                    }
                }
            }
                
                Spacer()
            }
            .padding(.bottom, 50)
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
