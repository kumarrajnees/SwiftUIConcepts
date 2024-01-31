//
//  Concurrency.swift
//  SwiftUIConcepts
//
//  Created by Rajneesh kumar on 16/01/24.
//

import SwiftUI

// Points
/// - @State guarantees it’s safe to change its value on any thread, we can use a detached task instead even though it won’t inherit actor isolation:
/*
struct Concurrency: View {
    @State var name = "Any"
    var body: some View {
        VStack {
            Text("Hello, \(name)!")
            Button {
                // PART 1
                // Task {
                //     name = "Rajneesh"
                // }
                
                // Part 2
                Task.detached {
                    name = "Taylor"
                }
                
            } label: {
                Text("Authenticate")
            }
        }
    }
}
 */

/*
 The rules change when we switch to an observable object that publishes changes. As soon as you add any @ObservedObject or @StateObject property wrappers to a view, Swift will automatically infer that the whole view must also run on the main actor.
 */

class ConcurrencyViewModel: ObservableObject {
    @Published var name = "Hello"
}
/*
struct Concurrency: View {
    @StateObject var viewModel = ConcurrencyViewModel()
    
    var body: some View {
        VStack {
            Text("Hello, \(viewModel.name)!")
            Button {
                // PART 1: The below code will work because the Task is on @MainActr/ MainThread
//                 Task {
//                     viewModel.name = "Rajneesh"
//                 }
                
//                 Part 2: Error - Main actor-isolated property 'viewModel' can not be mutated from a Sendable closure
//                Task.detached {
//                    viewModel.name = "Taylor"
//                }
                
            } label: {
                Text("Authenticate")
            }
        }
    }
}
*/

struct Concurrency: View {
    @StateObject var viewModel = ConcurrencyViewModel()
    
    var body: some View {
        VStack {
            Text("Hello, (viewModel.name)!")
            Button("Authenticate") {
                doWorkConcurrently()
            }
        }
    }
    
    // “In Task 1” printed 10,000 times, then “In Task 2” printed 10,000 times – even though we have created two tasks, they are executing sequentially. This happens because our @StateObject view model forces the entire view onto the main actor, meaning that it can only do one thing at a time.
    func doWork() {
        Task {
            for i in 1...100 {
                print("In Task 1: \(i)")
            }
        }
        
        Task {
            for i in 1...101 {
                print("In Task 2: \(i)")
            }
        }
    }
    
    // If we want to run the task concurrently
    
    
    func doWorkConcurrently() {
        Task.detached {
            for i in 1...100 {
                print("In Task 3: \(i)")
            }
        }
        
        Task.detached {
            for i in 1...101 {
                print("In Task 4: \(i)")
            }
        }
    }
}

struct ConfirmEraseItems: View {
    @State private var isShowingDialog = false
    var title: String
    var body: some View {
        Button("Empty Trash") {
            isShowingDialog = true
        }
        .confirmationDialog(
            title,
            isPresented: $isShowingDialog
        ) {
            Button("Empty Trash", role: .destructive) {
                // Handle empty trash action.
            }
            Button("Cancel", role: .cancel) {
                isShowingDialog = false
            }
        } 
//    message: {
//            Text("This is message2")
//                .font(.body)
////            VStack {
////                Image(systemName: "square.and.arrow.up.fill")
//////                Image(systemName: "flag")
////                
////                Text("This is message")
////            }
//        }
        .dialogIcon(Image(systemName: "square.and.arrow.up.fill"))
    }
}

#Preview {
    ConfirmEraseItems(title: "ThisIsDaioge")
}
