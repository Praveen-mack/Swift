import UIKit

// Methods

// Methods are functions that are associated with a particular type. Classes, structures, and enumerations can all define instance methods

// Instance Methods
// Instance methods are functions that belong to instances of a particular class, structure, or enumeration.

class Counter {
    var count = 0
    
    func increment() {
        count += 1
    }
    
    func increment(by amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.increment(by: 10)
counter.reset()


// The self Property
// Every instance of a type has an implicit property called self, which is exactly equivalent to the instance itself. You use the self property to refer to the current instance within its own instance methods.

class selfExample {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}


// Modifying Value Types from Within Instance Methods
// Structures and enumerations are value types. By default, the properties of a value type can’t be modified from within its instance methods.

struct changeName {
    var name: String
    
    mutating func change(name: String) {
        self.name = name
    }
}

var setName = changeName(name: "First")

// You can opt in to this behavior by placing the mutating keyword before the func keyword for that method


// Assigning to self Within a Mutating Method

enum Switches {
    case off, on
    
    mutating func set() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var light = Switches.off
light.set()


// Type Methods
// Instance methods, as described above, are methods that you call on an instance of a particular type. You can also define methods that are called on the type itself. These kinds of methods are called type methods.

class SomeClass {
    class func someText() {
        print("Random text")
    }
}

SomeClass.someText()
