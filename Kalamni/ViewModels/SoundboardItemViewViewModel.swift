//
//  SoundboardItemViewViewModel.swift
//  Kalamni
//
//  Created by csuftitan on 2/21/24.
//

import Foundation

class SoundboardItemViewViewModel: ObservableObject {
    init() {}

    func toggleIsFavorite(item: inout SoundboardItem) {
        item.setFavorite(!item.isFavorite)
    }
}
