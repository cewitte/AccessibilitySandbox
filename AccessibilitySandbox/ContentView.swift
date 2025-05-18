//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Carlos Eduardo Witte on 18/05/25.
//

import SwiftUI

struct ContentView: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks",
    ]
    
    var body: some View {
        
        VStack {
            Button {
                selectedPicture = Int.random(in: 0...3)
            } label: {
                Image(pictures[selectedPicture])
                    .resizable()
                    .scaledToFit()
            }
            .accessibilityLabel(labels[selectedPicture])
            
            
            Image(decorative: "character")
                .resizable()
                .scaledToFit()
                .accessibilityHidden(true)
            
            VStack {
                Text("Your score is")
                Text("1000")
                    .font(.largeTitle)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(Text("Your score is 1000"))
        }
        
    }
}

#Preview {
    ContentView()
}
