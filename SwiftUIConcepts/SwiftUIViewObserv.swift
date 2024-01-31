//
//  SwiftUIViewObserv.swift
//  SwiftUIConcepts
//
//  Created by Rajneesh kumar on 01/09/23.
//

import SwiftUI
import Combine

class ViewModel: ObservableObject {
    @Published var count1 = 0
    @Published var count2 = 9
    
    func didClicked1() {
        count1 += 1
    }
    
    func didClicked2() {
        count2 += 1
    }
}

struct SwiftUIViewObserv: View {
    
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        
        VStack {
            Button("Increment 1") {
                vm.didClicked1()
            }
            Text("Increment 1: \(vm.count1)")
            Button("Increment 2") {
                vm.didClicked2()
            }
            Text("Increment 2: \(vm.count2)")
        }

    }
}

struct SwiftUIViewObserv_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewObserv(vm: ViewModel())
    }
}
