//
//  HomeTabView.swift
//  SwiftUIConcepts
//
//  Created by Rajneesh kumar on 11/01/24.
//

import SwiftUI

struct HomeTabView: View {
    
    @State private var tabSelection = 1
    
    var body: some View {
        TabView(selection: $tabSelection,
                content:  {
            
            Text("Tab Content 12")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.green)
                .tabItem {
                Text("Tab Label 12")
                    
            }.tag(1)
            
            Text("Tab Content 2").tabItem { Text("Tab Label 2") }.tag(2)
            
            Text("Tab Content 3").tabItem { Text("Tab Label 3") }.tag(3)
        })
        .overlay(alignment: .bottom) {
            VStack {
                Image(systemName: "house")
                Text("Hello")
                    .onTapGesture {
                        tabSelection += 1
                    }
            }
            .padding(.top)
            .frame(maxWidth: .infinity)
            .background(.cyan, in: Capsule())
        }
    }
}

#Preview {
    HomeTabView()
}
