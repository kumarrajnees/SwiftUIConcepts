//
//  FullScreenCoverPresentedOnDismiss.swift
//  SwiftUIConcepts
//
//  Created by Rajneesh kumar on 13/01/24.
//

import SwiftUI

struct FullScreenCoverPresentedOnDismiss: View {
    @State private var isPresenting = false
    
    @State var data: String  = "Rajneesh"
    @StateObject var model = ViewModel()

    var body: some View {
        Button("Present Full-Screen Cover") {
            data = "New rajneesh"
            model.coverData = CoverData(body: "Slide Observable Custom Data")
            isPresenting.toggle()
        }
        .fullScreenCover(isPresented: $isPresenting,
                         onDismiss: didDismiss) {
            VStack {
                Text("A full-screen modal view.")
                    .font(.title)
                Text("My Name: \(data)")
                Text("ViewModel: \(model.coverData?.body ?? "")")
                Text("Tap to Dismiss")
            }
            .onTapGesture {
                isPresenting.toggle()
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity)
            .background(Color.blue)
            .ignoresSafeArea(edges: .all)
        }
    }


    func didDismiss() {
        // Handle the dismissing action.
    }
}

struct CoverData: Identifiable {
    var id: String {
        return body
    }
    let body: String
}

#Preview {
    FullScreenCoverPresentedOnDismiss()
}
