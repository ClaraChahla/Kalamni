//
//  SoundboardView.swift
//  Kalamni
//
//  Created by csuftitan on 2/21/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct SoundboardView: View {
    @StateObject var viewModel:SoundboardViewViewModel
    var items: [SoundboardItem]

    init(userID: String) {
        self._viewModel = StateObject(wrappedValue: SoundboardViewViewModel(userID: userID))
        self.items = SoundboardItem.sampleData
//        print(UIScreen.main.bounds.width)
//        print(UIScreen.main.bounds.height)
    }
    
    let columns: [GridItem] = [
        GridItem(.fixed(110)),
        GridItem(.fixed(110)),
        GridItem(.fixed(110)) ]
    
    var body: some View {
        NavigationView {
            ZStack {
                HeaderView(title: "Soundboard", subtitle: "", angle: 10, background: .mint).padding(.bottom, 420)
                if let language = viewModel.language {
                    let itemset = items.chunked(into: 9)

                    VStack {
                        TabView {
                            if items.count != 0 {
                                ForEach(itemset, id: \.self) { itemGroup in
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                            .frame(width: 360, height: 390)
                                            .foregroundColor(.mint)
                                            .offset(y:130)
                                        VStack {
                                            Spacer().frame(minHeight: 260, maxHeight: 260)
                                            LazyVGrid(columns: columns) {
                                                        ForEach(itemGroup, id: \.self) { item in
                                                            SoundboardItemView(item: item, language: language){
                                                                viewModel.talk(textEnglish: item.textEnglish, textArabic: item.textArabic, language: language)
                                                            }
                                                                              .frame(width: 125, height: 125)
                                                        }
                                                    }
                                            if (itemGroup.count < 4) {
                                                Spacer().frame(minHeight: 250, maxHeight: 250)
                                            } else if (itemGroup.count < 7) {
                                                Spacer().frame(minHeight: 125, maxHeight: 125)
                                            }
                                        }
                                    }
                                }
                            } else {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15).frame(width: 360, height: 420).foregroundColor(.mint).offset(y:100)
                                    Text("Nothing to show right now")
                                        .bold()
                                        .foregroundColor(.white)
                                        .font(.system(size: 20))
                                        .offset(y: 100)
                                        .shadow(color: .black, radius: 1)
                                }
                            }
                        }
                                .tabViewStyle(PageTabViewStyle())
                                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    }
                } else {
                    Text("Loading Soundboard...")
                }
            }
        }.onAppear {
//            viewModel.language = "en-US"
            viewModel.language = SoundboardViewViewModel.currentLanguage
            if (viewModel.language == nil) {
                viewModel.fetchLanguage()
            }
        }
        .onDisappear {
            viewModel.language = nil
        }
    }
}

#Preview {
    SoundboardView(userID: "jN86jmw34QgA3vbWRXEucS2MVyB3")
}
