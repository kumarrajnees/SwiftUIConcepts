//
//  VerticleCapsuleSwiftUIView.swift
//  SwiftUIConcepts
//
//  Created by Rajneesh kumar on 05/01/24.
//

import SwiftUI

struct VerticleCapsuleSwiftUIView: View {
    
   let items = ["Hello", "UIView", "SwiftUIView", "CapsuleSwiftUI", "VerticleCapsuleSwift","Hello", "UIView", "SwiftUIView", "CapsuleSwiftUI", "VerticleCapsuleSwift","Hello", "UIView", "SwiftUIView", "CapsuleSwiftUI", "VerticleCapsuleSwift","Hello", "UIView", "SwiftUIView", "CapsuleSwiftUI", "VerticleCapsuleSwift"]
    @State private var vibrateOnRing = true
    @State private var vibrateOnRing2 = true
    let terms = String(repeating: "abcde ", count: 100)

    var body: some View {

        ViewThatFits(in: .vertical) {
//            ForEach(items, id:\.self) { value in
//                ItemView(text: value)
//            }
            HStack {
                Text("ssds1")
                Text("ssds2")
                Text("ssds3")
                Text("ssds4")
                Text("ssds5")
                Text("ssds6")
                Text("ssds")
                Text("ssds")
                Text("ssds")
                Text("ssds")
                Text("ssds")
                Text("ssds")
            }
            
            

//            ScrollView {
//                Text(terms)
//            }
        }
        
        VStack {
            Toggle("Vibrate on Ring",
                   systemImage: "dot.radiowaves.left.and.right",
                   isOn: $vibrateOnRing)
            Toggle("Vibrate on Ring",
                   isOn: $vibrateOnRing2)
            .foregroundColor(.black)
                .tint(.red)
                    
        }
        .toggleStyle(.switch)
        
        VStack {
            Toggle("Vibrate on Ring",
                   systemImage: "dot.radiowaves.left.and.right",
                   isOn: $vibrateOnRing)
            Toggle("Vibrate on Ring",
                   isOn: $vibrateOnRing2)
            .foregroundColor(.black)
                .tint(.red)
                    
        }
        .toggleStyle(.button)
        
//        ViewThatFits {
//            HStack {
//                Text("The rain")
//                Text("in Spain")
//                Text("falls mainly")
//                Text("on the Spaniards")
//                Text("The rain")
//                Text("in Spain")
//                Text("falls mainly")
//                Text("on the Spaniards")
//            }
//
//            VStack {
//                Text("The rain")
//                Text("in Spain")
//                Text("falls mainly")
//                Text("on the Spaniards")
//            }
//        }
        
        ScrollView(){
            ForEach(items, id:\.self) { value in
                ItemView(text: value)
            }
            //
        }
        .frame(maxWidth: .infinity)
        .background(.cyan)
    }
}

struct DynamicStack<Content: View>: View {
    var horizontalAlignment = HorizontalAlignment.center
    var verticalAlignment = VerticalAlignment.center
    var spacing: CGFloat?
    @ViewBuilder var content: () -> Content

    var body: some View {
        ViewThatFits {
            HStack(
                alignment: verticalAlignment,
                spacing: spacing,
                content: content
            )

            VStack(
                alignment: horizontalAlignment,
                spacing: spacing,
                content: content
            )
        }
    }
}

struct ItemView: View {
    var text: String
    var body: some View {
        HStack {
            Text(text)
        } 
        .padding()
        .background(.gray, in: Capsule())
    }
}

#Preview {
    VerticleCapsuleSwiftUIView()
}
