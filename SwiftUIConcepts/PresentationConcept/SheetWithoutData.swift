//
//  ShowLicenseAgreement.swift
//  SwiftUIConcepts
//
//  Created by Rajneesh kumar on 13/01/24.
//

import SwiftUI

struct SheetWithoutData: View {
    @State private var isShowingSheet = false
    
    @State var mValue = ""
    
    var body: some View {
        Button(action: {
            mValue = "Data New Value"
            isShowingSheet.toggle()
            
        }) {
            Text("Show License Agreement")
        }
        .sheet(isPresented: $isShowingSheet,
               onDismiss: didDismiss) {
            VStack {
                Text("License Agreement")
                    .font(.title)
                    .padding(50)
                // Data is not visible
                Text("My Value: \(mValue)")
                    .font(.title)
                    .padding(50)
                Text("License Agreement2")
                    .font(.title)
                    .padding(50)

                Text("""
                        Terms and conditions go here.
                    """)
                    .padding(50)
                Button("Dismiss",
                       action: { isShowingSheet.toggle() })
            }
        }
    }


    func didDismiss() {
        // Handle the dismissing action.
    }
}

#Preview {
    SheetWithoutData()
}
