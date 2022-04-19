import UIKit

// Properties

// Properties associate values with a particular class, structure, or enumeration. Stored properties store constant and variable values as part of an instance, whereas computed properties calculate (rather than store) a value. Computed properties are provided by classes, structures, and enumerations. Stored properties are provided only by classes and structures.

// Stored Properties

struct FixedLenghtRange {
    var firstValue: Int
    let lenght: Int
}
var rangeOfThreeItems = FixedLenghtRange(firstValue: 2, lenght: 3)
print(rangeOfThreeItems)

// rangeOfThreeItems.lenght = 5  // Store properties constant can't change their value.


// Stored Properties of Constant Structure Instances

let checkConstantInstance = FixedLenghtRange(firstValue: 1, lenght: 2)
//checkConstantInstance.firstValue = 3

// This behavior is due to structures being value types. When an instance of a value type is marked as a constant, so are all of its properties.

// The same isn’t true for classes, which are reference types. If you assign an instance of a reference type to a constant, you can still change that instance’s variable properties.


// Lazy Stored Properties
// A lazy stored property is a property whose initial value isn’t calculated until the first time it’s used. You indicate a lazy stored property by writing the lazy modifier before its declaration.
// By using lazy which is not in use system memory until property and object are get intialized
// Lazy properties can set it's properties only one time, not multiple time.

struct ComplexTask {
    static var firstValue: Int = 1
    static var result: Int = 0

    static func doComplexTask() -> Int {
        var task: [Int] = []

        for i in firstValue...5000 {
            task.append(i)
        }

        result = task.first!

        return result
    }
}

struct Employee {
    lazy var complexTask: Int = ComplexTask.doComplexTask()
}

var objEmployee = Employee()
print(objEmployee.complexTask)

ComplexTask.firstValue = 100

print("Updated value = \(objEmployee.complexTask)")


// Computed Properties
// computed properties cannot use constant, they don't have a initial value.

struct LoanCalculator {
    var loanAmount: Int
    var rateOfInterest: Int
    var year: Int
    var simleInterest: Int {
        get {
            return (loanAmount * rateOfInterest * year) / 100
        }
    }
}

let loanCalculator = LoanCalculator(loanAmount: 50000, rateOfInterest: 10, year: 4)
print("Interest amount \(loanCalculator.simleInterest)")


struct Circle {
    var radius: Double = 0
    var area: Double {
        get {
            return radius * radius * Double.pi
        }
        
        set {
            radius = sqrt(newValue / Double.pi)
        }
    }
}

var circle = Circle()
circle.radius = 5
print("Area = \(circle.area)")

circle.area = 25
print("Radius = \(circle.radius)")


// Read-Only Computed Properties
// A computed property with a getter but no setter is known as a read-only computed property. A read-only computed property always returns a value, and can be accessed through dot syntax, but can’t be set to a different value.

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    
    var volume: Double {
        return width * height * depth
    }
}

let cuboidInstants = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
cuboidInstants.volume


// Property Observers
// willSet is called just before the value is stored.
// didSet is called immediately after the new value is stored.

class Bank {
    var accountBalance: Double {
        didSet {
            sendMessage()
        }
        
        willSet {
            if newValue > 10000000 {
                sendMessageToManagers()
            }
        }
    }
    
    init(openingBalance: Double) {
        accountBalance = openingBalance
    }
    
    func addAmount(amount: Double) {
        accountBalance += amount
    }
    
    func withDraw(amount: Double) {
        accountBalance -= amount
    }
    
    func sendMessage() {
        print("Account balance updated new balance \(accountBalance)")
    }
    
    func sendMessageToManagers() {
        print("Please have a look at this transaction")
    }
}

var bank = Bank(openingBalance: 1000)
bank.addAmount(amount: 50000000)


// Property Wrappers
// A property wrapper adds a layer of separation between code that manages how a property is stored and the code that defines a property.

// The property wrapper is responsible for storing the wrapped value, so there’s no synthesized code for that.

// To define a property wrapper, you make a structure, enumeration, or class that defines a wrappedValue property.

@propertyWrapper
struct FiftyOrLess {
    private var weight: Int
    
    init() {
        self.weight = 0
    }
    
    var wrappedValue: Int {
        get {
            return weight
        }
        set {
            weight = min(newValue, 50)
        }
    }
}

struct Suitcase {
    let color: String
    @FiftyOrLess var weight: Int
    
    init(color: String, weight: Int) {
        self.color = color
        self.weight = weight
    }
}

struct Ticket {
    var passengerName = "" {
        willSet {
            print("About to set the name of a passenger. Please confirm")
        }
        
        didSet {
            if passengerName != oldValue {
                print("Congrats! you have successfully changed the name")
            }
        }
    }
    
    var bag1: Suitcase
    var bag2: Suitcase
    
//    var isTotalWeightAcceptable: Bool {
//        get {
//            let total = bag1.weight + bag2.weight
//            return total <= 50
//        }
//    }
}

var bag = Suitcase(color: "Red", weight: 400)
bag.weight

