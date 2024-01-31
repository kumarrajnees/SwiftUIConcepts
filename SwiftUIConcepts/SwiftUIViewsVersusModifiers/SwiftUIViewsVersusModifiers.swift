//
//  SwiftUIViewsVersusModifiers.swift
//  SwiftUIConcepts
//
//  Created by Rajneesh kumar on 25/01/24.
//

import SwiftUI


struct FeaturedLabel<Content: View>: View {
    @ViewBuilder var content: () -> Content
    @State private var opacity = 0.0

    var body: some View {
        HStack {
            Image(systemName: "star")
            content()
        }
        .foregroundColor(.orange)
        .font(.headline)
        .opacity(opacity)
        .onAppear(perform: {
            withAnimation(.linear(duration: 2)) {
                opacity = 1.0
            }
        })
    }
}

// MARK: -
struct FeaturedModifier: ViewModifier {
   
    @State private var opacity = 0.0

    func body(content: Content) -> some View {
        HStack {
            Image(systemName: "star")
            content
        }
        .foregroundColor(.orange)
        .font(.headline)
        .opacity(opacity)
        .onAppear(perform: {
            withAnimation(.linear(duration: 2)) {
                opacity = 1.0
            }
        })
    }
}

extension View {
    
}

// MARK: -
extension FeaturedLabel where Content == Text {
    init(_ text: String) {
        self.init {
            Text(text)
        }
    }
}

struct SwiftUIViewsVersusModifiers: View {
    
    @State private var isToggleOn = false

    var body: some View {
        
        Group {
            FeaturedLabel("Text")
            Text("Hello, world!").featured()
            Text("Hello, world!")
                .featuredOptionTwo()

        }
        
        Group {
            // View-based version:
            FeaturedLabel {
                Toggle("Toggle", isOn: $isToggleOn)
            }
            
            // Modifier-based version:
            Toggle("Toggle", isOn: $isToggleOn).featured()
        }
        
        VStack {
            FeaturedLabel {
                Text("Rajneesh")
            }
            Text("Rajneesh").featured()

            Rectangle()
                .frame(maxWidth: 100, maxHeight: 100)
                .overlay(content: {
                    HStack {
                        Image(systemName: "star")
                        Text("Rajneesh")
                    }
                    .foregroundColor(.black)
                    .font(.headline)
                })
                .featured()
        }
    }
}

#Preview {
    SwiftUIViewsVersusModifiers()
}


/// Extension View
///

extension View {
    func featured() -> some View {
        HStack {
            Image(systemName: "star")
            self
        }
        .foregroundColor(.orange)
        .font(.headline)
    }
    
    func featuredOptionTwo() -> some View {
        modifier(FeaturedModifier())
    }
}

