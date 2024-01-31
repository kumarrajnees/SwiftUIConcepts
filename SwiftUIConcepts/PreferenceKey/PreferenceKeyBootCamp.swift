//
//  PreferenceKeyBootCamp.swift
//  SwiftUIConcepts
//
//  Created by Rajneesh kumar on 26/12/23.
//

import SwiftUI

struct PreferenceKeyBootCamp: View {
    
    @State private var text: String = "Hello World!"
    
    var body: some View {
        NavigationView {
            VStack {
                SecondaryView(text: text)
                    .navigationTitle("Nav Title")
            }
        }
        .onPreferenceChange(CustomTitlePreferenceKey.self, perform: { value in
            self.text =  value
        })
    }
}

#Preview {
    PreferenceKeyBootCamp()
}

struct SecondaryView: View {
    
    let text: String
    var body: some View {
        Text(text)
        .customeTitle("From Base BootCamp")
    }
}

extension View {
    func customeTitle(_ text: String) -> some View {
        preference(key: CustomTitlePreferenceKey.self, value: text)
    }
}

struct CustomTitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}
