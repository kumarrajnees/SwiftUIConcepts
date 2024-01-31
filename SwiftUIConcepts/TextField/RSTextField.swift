//
//  RSTextField.swift
//  SwiftUIConcepts
//
//  Created by Rajneesh kumar on 30/01/24.
//

import SwiftUI

struct RSTextField: View {
    
    var titleKey: LocalizedStringKey
    @Binding var text: String
    
    var body: some View {
        TextField(titleKey, text: $text)
    }
}

#Preview {
    RSTextField(titleKey: "TT", text: .constant(""))
}

// unsorted 313 1,2
// vehical
