import UIKit

// Inheritance

// A class can inherit methods, properties, and other characteristics from another class. When one class inherits from another, the inheriting class is known as a subclass, and the class it inherits from is known as its superclass.

// Defining a Base Class

class Vehicle {
    var currentSpeed = 0.0
    
    var description: String {
        return "travelling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        // code
    }
}
let firstVehicle = Vehicle()
firstVehicle.description


// Subclassing
// Subclassing is the act of basing a new class on an existing class. The subclass inherits characteristics from the existing class, which you can then refine. You can also add new characteristics to the subclass.

// To indicate that a subclass has a superclass, write the subclass name before the superclass name, separated by a colon:

class CarClass: Vehicle {
    var carModel = "i8"
}

let newVehicle = CarClass()
newVehicle.carModel
newVehicle.currentSpeed = 15.0
newVehicle.description

class ExtendCarSeat: CarClass {
    var currentNumberOfPassenger = 0
}

let carExtend = ExtendCarSeat()
carExtend.currentSpeed = 22
carExtend.currentNumberOfPassenger = 4
carExtend.description


// Overriding
// A subclass can provide its own custom implementation of an instance method, type method, instance property, type property, or subscript that it would otherwise inherit from a superclass. This is known as overriding.

// Overriding Methods

class Train: Vehicle {
    override func makeNoise() {
        print("Loud horn")
    }
}
let train = Train()
train.makeNoise()

// Overriding Property Getters and Setters

class Car: Vehicle {
    var gear = 5
    
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.gear
car.currentSpeed = 26
car.description


// Preventing Overrides
// You can prevent a method, property, or subscript from being overridden by marking it as final.
// Do this by writing the final modifier before the method, property, or subscript’s introducer keyword (such as final var, final func, final class func, and final subscript).
