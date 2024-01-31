//
//  FullScreenCoverWithData.swift
//  SwiftUIConcepts
//
//  Created by Rajneesh kumar on 13/01/24.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var coverData: CoverData?
}


struct FullScreenCoverWithData: View {
    
    @State private var coverData: CoverData?
    
    var body: some View {
        Button("Present Full-Screen Cover With Data") {
            coverData = CoverData(body: "New Data Custom Data")
        }
        .fullScreenCover(item: $coverData,
                         onDismiss: didDismiss) { details in
            VStack(spacing: 20) {
                Text("\(details.body)")
            }
            .onTapGesture {
                coverData = nil
            }
        }
    }


    func didDismiss() {
        // Handle the dismissing action.
    }


}


#Preview {
    FullScreenCoverWithData()
}
