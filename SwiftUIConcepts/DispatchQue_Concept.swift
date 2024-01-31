//
//  DispatchQue_Concept.swift
//  SwiftUIConcepts
//
//  Created by Rajneesh kumar on 07/01/24.
//

import Foundation

class DispatchQuesGroupConcept {
    
    let dispatchGroup = DispatchGroup()

    func executeTask() -> String {
        // Add a task to the group
        print("Task1 entry - Before")
        dispatchGroup.enter()
        print("Task1 entry")
        DispatchQueue.global().async {
            // Perform task
            sleep(4)
            print("Task1")
            self.dispatchGroup.leave()
        }

        // Add another task to the group
        print("Task2 entry - Before")
        dispatchGroup.enter()
        print("Task2 entry")
        DispatchQueue.global().async {
            // Perform task
            sleep(2)
            print("Task2")
            self.dispatchGroup.leave()
        }

        print("Task2 Before Wait")
        // Wait for all tasks to complete
        dispatchGroup.wait()
        // Continue with other code
        
        print("Task2 after Wait")
        
        return "All Done"
    }
    
    
    func executeTaskAndNotify() {
        // Add a task to the group
        print("Task1 entry - Before")
        dispatchGroup.enter()
        print("Task1 entry")
        DispatchQueue.global().async {
            // Perform task
            sleep(4)
            print("Task1")
            self.dispatchGroup.leave()
        }

        // Add another task to the group
        print("Task2 entry - Before")
        dispatchGroup.enter()
        print("Task2 entry")
        DispatchQueue.global().async {
            // Perform task
            sleep(2)
            print("Task2")
            self.dispatchGroup.leave()
        }

        print("Task2 Before Wait")
        // Wait for all tasks to complete
        dispatchGroup.notify(queue: .main) {
            print("All Task Done")

        }
        // Continue with other code
    }
    
}

// MARK: Execute aync task serially
class DispatchQuesConcept {
    
    let dispatchGroup = DispatchGroup()

//    let dispatchGroup = DispatchGroup()

    
    func executeTask() -> String {
        // Add a task to the group
        print("Task1 entry - Before")
        dispatchGroup.enter()
        print("Task1 entry")
        DispatchQueue.global().async {
            // Perform task
            sleep(4)
            print("Task1")
            self.dispatchGroup.leave()
        }

        // Add another task to the group
        print("Task2 entry - Before")
        dispatchGroup.enter()
        print("Task2 entry")
        DispatchQueue.global().async {
            // Perform task
            sleep(2)
            print("Task2")
            self.dispatchGroup.leave()
        }

        print("Task2 Before Wait")
        // Wait for all tasks to complete
        dispatchGroup.wait()
        // Continue with other code
        
        print("Task2 after Wait")
        
        return "All Done"
    }
    
    
    func executeTaskAndNotify() {
        // Add a task to the group
        print("Task1 entry - Before")
        dispatchGroup.enter()
        print("Task1 entry")
        DispatchQueue.global().async {
            // Perform task
            sleep(4)
            print("Task1")
            self.dispatchGroup.leave()
        }

        // Add another task to the group
        print("Task2 entry - Before")
        dispatchGroup.enter()
        print("Task2 entry")
        DispatchQueue.global().async {
            // Perform task
            sleep(2)
            print("Task2")
            self.dispatchGroup.leave()
        }

        print("Task2 Before Wait")
        // Wait for all tasks to complete
        dispatchGroup.notify(queue: .main) {
            print("All Task Done")

        }
        // Continue with other code
    }
    
}
