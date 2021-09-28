//
//  ContentView.swift
//  AwordsCollectionApp
//
//  Created by Alexey Efimov on 05.08.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showAword = false
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    showAword.toggle()
                }
            }) {
                HStack {
                    Text(showAword ? "Hide Shape" : "Show Shape")
                    Image(systemName: "chevron.up.square")
                        .rotationEffect(.degrees(showAword ? 0 : 180))
//                        .animation(.easeInOut)
                }
            }
            
            Spacer()
            
            if showAword {
                GradientRectangles(width: 250, height: 250)
                    .animation(.default)
                    .transition(.transition)
            }
            
            Spacer()
        }
        .font(.headline)
        .padding()
    }
}

extension AnyTransition {
    static var transition: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: .scale)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
