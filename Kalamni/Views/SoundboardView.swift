//
//  SoundboardView.swift
//  Kalamni
//
//  Created by csuftitan on 2/21/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct SoundboardView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @StateObject var viewModel:SoundboardViewViewModel
    var items: [SoundboardItem]
    @State var queue: [SoundboardItem]

    init(userID: String) {
        self._viewModel = StateObject(wrappedValue: SoundboardViewViewModel(userID: userID))
        self.items = SoundboardItem.sampleData
        self.queue = []
//        print(UIScreen.main.bounds.width)
//        print(UIScreen.main.bounds.height)
    }
    
//    let columns: [GridItem] = [
//        GridItem(.adaptive(minimum: 60)),
//        GridItem(.adaptive(minimum: 60)),
//        GridItem(.adaptive(minimum: 60))
//    ]
//    
    let rows = Array(repeating: GridItem(.fixed(85)), count: 3)
    let qrows = Array(repeating: GridItem(.fixed(85)), count: 1)

    
    var body: some View {
        NavigationView {
                if let language = viewModel.language {
//                    let itemset = items.chunked(into: 12)

                    TabView {
                        if items.count != 0 {
//                            ForEach(items, id: \.self) { itemGroup in
//                                ZStack {
//                                    RoundedRectangle(cornerRadius: 15)
                               //     .frame(width: 380, height: 400)
//                                    .foregroundColor(.mint)
                            
//text box
                            Grid {
                                ScrollView(.horizontal) {
                                                                    

                                                                    
                                //soundcards
                                                LazyHGrid(rows: qrows) {
                                                    ForEach(Array(queue.enumerated()), id: \.element) { index, element in
                                                    SoundboardItemView(item: element, language: language){
                                                        queue.remove(at: index)
                                                            }
                                                        }
                                                    }
                                                }
                                            .scrollTargetLayout()

                                
//clear button
                                VStack {
                                    Button("Clear") {
                                        queue.removeAll()
                                    }
                                    .foregroundColor(.black).opacity(0.6)
                                    .accentColor(.teal)
                                    .font(.system(size: 30))
                                    .bold()
                                    .buttonStyle(.borderedProminent)
                                    //.offset(x: -35, y: -242)
                                }
                                
//speak button
                                VStack {
                                    Button("Speak") {
                                        viewModel.playQueue(queue: queue)
                                    }
                                    .foregroundColor(.black).opacity(0.6)
                                    .accentColor(.teal)
                                    .font(.system(size: 30))
                                    .bold()
                                    .contentShape(Circle())
                                    .buttonStyle(.borderedProminent)

                                    //.offset(x: 110, y: -299)
                                }
                            
                            
ScrollView(.horizontal) {
                                    

                                    
//soundcards
                LazyHGrid(rows: rows) {
                    ForEach(items, id: \.self) { item in
                    SoundboardItemView(item: item, language: language){
                        queue.append(item)
                    }
                    .padding(.bottom, -15)
                    .padding(.leading, -15)
                    .padding(.trailing, -15)
                    .containerRelativeFrame(.horizontal, count: verticalSizeClass == .regular ? 3 : 5, spacing: 16)
                
                        }
                    }
                }
            .scrollTargetLayout()
//                                }
                            }
                        } else {
                            ZStack {
                                    RoundedRectangle(cornerRadius: 15).frame(width: 360, height: 420).foregroundColor(.mint).offset(y:100)
                                    Text("Nothing to show right now")
                                    .bold()
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                                    .shadow(color: .black, radius: 1)
                            }
                        }
                    }
                    .contentMargins(16, for: .scrollContent)
                    .scrollTargetBehavior(.viewAligned)
//                    .tabViewStyle(PageTabViewStyle())
//                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
                    else {
                            Text("Loading Soundboard...")
                    }
        }.onAppear {
            UIPageControl.appearance().currentPageIndicatorTintColor = .systemTeal
            UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemTeal.withAlphaComponent(0.2)
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
