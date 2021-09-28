//
//  CustomGridView.swift
//  AwordsCollectionApp
//
//  Created by brubru on 27.09.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct CustomGridView<Content: View, T>: View {
    let items: [T]
    let columns: Int
    let content: (T, CGFloat) -> Content
    
    var rows: Int {
        items.count / columns
    }
    
    var body: some View {
       GeometryReader { geometry in
           let sideSize = geometry.size.width / CGFloat(columns)
           
            ScrollView {
                VStack {
                    ForEach(0...rows, id: \.self) { rowIndex in
                        HStack {
                            ForEach(0..<columns) { columnIndex in
                                if let index = indexFor(row: rowIndex, column: columnIndex) {
                                    content(items[index], sideSize)
                                        .frame(width: sideSize, height: sideSize)
                                } else {
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    private func indexFor(row: Int, column: Int) -> Int? {
        let index = row * columns + column
        return index < items.count ? index : nil
    }
}

struct CustomGridView_Previews: PreviewProvider {
    static var previews: some View {
        CustomGridView(items: [11, 4, 7, 17, 5, 2, 1], columns: 3) { item,itemSize  in
            VStack {
                Text("\(item)")
            }
            .padding()
            .frame(width: itemSize, height: itemSize)
        }
    }
}
