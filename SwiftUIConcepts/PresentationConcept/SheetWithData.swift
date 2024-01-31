//
//  SheetWithData.swift
//  SwiftUIConcepts
//
//  Created by Rajneesh kumar on 13/01/24.
//

import SwiftUI

struct SheetWithData: View {
    @State private var sheetDetail: InventoryItem?

    var body: some View {
        Button("Show Part Details") {
            sheetDetail = InventoryItem(
                id: "8010334433",
                partNumber: "Z-1234A",
                quantity: 100000000,
                name: "Widget2")
        }
        .sheet(item: $sheetDetail,
               onDismiss: didDismiss) { detail in
            VStack(alignment: .leading, spacing: 20) {
                Text("Part Number: \(detail.partNumber)")
                Text("Name: \(detail.name)")
                Text("Quantity On-Hand: \(detail.quantity)")
            }
            .onTapGesture {
                sheetDetail = nil
            }
        }
    }


    func didDismiss() {
        // Handle the dismissing action.
    }
}


struct InventoryItem: Identifiable {
    var id: String
    let partNumber: String
    let quantity: Int
    let name: String
}

#Preview {
    SheetWithData()
}
