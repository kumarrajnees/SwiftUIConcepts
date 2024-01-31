//
//  SwiftUIViewObserv_Error.swift
//  SwiftUIConcepts
//
//  Created by Rajneesh kumar on 01/09/23.
//

import SwiftUI
import Combine

class ParentViewModel: ObservableObject {
    @Published var text: String = ""
}

struct ParentView: View {
    @ObservedObject var viewModel = ParentViewModel()
    
    var body: some View {
        VStack {
            TextField("Text", text: $viewModel.text)
            SubView()
        }
    }
}

class SubViewModel: ObservableObject {
    @Published var countText: String = "0"
    private var count: Int = 0
    
    func didClickIncrement() {
        count += 1
        countText = "\(count)"
    }
}

struct SubView: View {
    @StateObject var viewModel = SubViewModel()
    
    var body: some View {
        VStack {
            Button("Increment") {
                viewModel.didClickIncrement()
            }
            Text(viewModel.countText)
        }
    }
}
struct SwiftUIViewObserv_Error_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
