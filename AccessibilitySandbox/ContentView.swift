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
    
    @State private var value = 10
    
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
            
            Spacer()
            
            VStack {
                Text("Total Points: \(value)")
                
                HStack {
                    Button("Increment") {
                        value += 1
                    }
                    
                    Button("Decrement") {
                        value -= 1
                    }
                }
                .accessibilityElement()
                .accessibilityLabel("Value")
                .accessibilityValue(String(value))
                .accessibilityAdjustableAction { direction in
                switch direction {
                case .increment:
                        value += 1
                    case .decrement:
                        value -= 1
                    default:
                        print("Not supported")
                    }
                }
            }
            
            Spacer()
            
            VStack {
                Button("John Fitzgerald Kennedy") {
                    print("Button tapped")
                }
                .padding(12)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(.rect)
                .cornerRadius(25)
                .accessibilityInputLabels(["John Fitzgerald Kennedy", "Kennedy", "JFK"])
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}
