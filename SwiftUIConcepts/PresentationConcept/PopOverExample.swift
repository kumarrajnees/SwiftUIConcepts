//
//  PopOverExample.swift
//  SwiftUIConcepts
//
//  Created by Rajneesh kumar on 13/01/24.
//

import SwiftUI

struct PopoverExample: View {
    @State private var isShowingPopover = false


    var body: some View {
        Button("Show Popover") {
            self.isShowingPopover = true
        }
        .popover(isPresented: $isShowingPopover) {
            ScrollView(.vertical) {
                VStack {
                    ForEach(1...10, id:\.self) { index in
                        Text("Popover Content: \(index)")
                            .padding(.vertical)
                    }
                }
                    .padding()
            }
           
        }
    }
}

#Preview {
    PopoverExample()
}
