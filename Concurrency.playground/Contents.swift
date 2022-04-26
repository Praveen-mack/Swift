import UIKit

// Concurrency
// Doing multiple task at the same time.

// Main vs background

// Main
DispatchQueue.main.async {
    // Code to run on main thread
}

// background
DispatchQueue.global(qos: .background).async {
    // Code to run on background thread
}

//  Serial vs Concurrent
let queue = DispatchQueue(label: "queue", attributes: .concurrent)

queue.async {
    print("Task 1 started")
    print("Task 1 ended")
}

queue.async {
    print("Task 2 started")
    print("Task 2 ended")
}

