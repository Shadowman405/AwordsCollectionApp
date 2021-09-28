//
//  ShapesView.swift
//  AwordsCollectionApp
//
//  Created by Alexey Efimov on 05.08.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

//struct AwardsView: View {
//    let awards = Award.getAwards()
//
//    var activeAwards: [Award] {
//        awards.filter { $0.awarded }
//    }
//
//    var body: some View {
//        NavigationView {
//            CustomGridView(items: activeAwards, columns: 2) { award in
//                VStack {
//                    award.awardView
//                    Text(award.title)
//                }
//            }
//            .navigationBarTitle("Shapes")
//        }
//    }
//}

struct AwardsView: View {
    let awards = Award.getAwards()
    let columns = [GridItem(.adaptive(minimum: 160, maximum: 200))]
    
    var activeAwards: [Award] {
        awards.filter { $0.awarded }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(activeAwards, id: \.title) { award in
                        VStack {
                            award.awardView
                            Text(award.title)
                        }
                    }
                }
                .navigationBarTitle("Shapes")
            }
        }
    }
}


struct ShapesView_Previews: PreviewProvider {
    static var previews: some View {
        AwardsView()
    }
}
