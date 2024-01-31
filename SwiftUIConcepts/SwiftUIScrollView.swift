//
//  SwiftUIScrollView.swift
//  SwiftUIConcepts
//
//  Created by Rajneesh kumar on 03/12/23.
//

import SwiftUI

struct SwiftUIScrollView: View {
    var body: some View {
//        ScrollViewReader { action in
           ScrollView {
               
               ScrollView(.horizontal) {
                   LazyHStack {                              // << this !!
                       ForEach(0...100, id:\.self) { index in
                           Text(String(index))
                               .frame(height: 50)
                               .onAppear(perform: {
                                       print("Appear_H: ", index)
                               })
                       }
                   }
               }
               .background(.red)
               
                LazyVStack {                              // << this !!
                    ForEach(0...1000, id:\.self) { index in
                        Text(String(index))
                            .frame(height: 50)
                            .onAppear(perform: {
                                    print("Appear_V: ", index)
                            })
                    }
                }
            }
//        }
    }
}




#Preview {
    SwiftUIScrollView()
}
