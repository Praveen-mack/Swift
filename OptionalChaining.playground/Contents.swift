import UIKit

// Optional Chaining

// Optional chaining is a process for querying and calling properties, methods, and subscripts on an optional that might currently be nil

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRoom = 1
}

let john = Person()
john.residence = Residence()
john.residence?.numberOfRoom


var token: Int?
token = 4

if token != nil {
    print(token!)
}

if let getToken = token {
    print("token is \(getToken)")
}


struct Parts {
    let name: String?
    let price: Int?
}

class Components {
    
    func findParts(name: String) -> Parts? {
        
        if name == "keyboard" {
            return Parts(name: "Key board", price: 900)
        } else if name == "mouse" {
            return Parts(name: "Mouse", price: 3405)
        }
        
        return nil
    }
}

let objComputerPart = Components()

// Optional binding
if let parts = objComputerPart.findParts(name: "keyboard") {
    if let partPrice = parts.price {
        print(partPrice)
    }
}

// Option chaining
if let part = objComputerPart.findParts(name: "mouse")?.price {
    print(part)
} else {
    print("No item found")
}


// Optional value
var dogName: String? = "Pupp"
print("My dog's name is \(dogName)")

dogName = nil
print("My dog's name is \(dogName)")


// Force unwrapping
var dogName1: String? = "Pupp"
print("My dog's name is \(dogName1!)")

dogName1 = nil
if dogName != nil {
    print("My dog's name is \(dogName1!)")
}

func code(for title: String, sampleCode: () -> Void) {
    print("""
    ---------------------
    '\(title)'
    """)
    
    sampleCode()
}

func randomOptionInt() -> Int? {
    Bool.random() ? Int.random(in: 1...10) : nil
}

// Option binding

if let getValue = randomOptionInt() {
    print("The value is \(getValue)")
} else {
    print("No number found")
}


enum Myerror: Error {
    case negativeNumber
    case zero
}

func spinWheel() throws -> Int {
    let number = Int.random(in: -5...5)
    if number < 0 { throw Myerror.negativeNumber }
    if number == 0 { throw Myerror.zero }
    
    return number
}

code(for: "Do catch") {
    do {
        let number = try spinWheel()
        print("The number is \(number)")
    } catch {
        print("Error: \(error)")
    }
}


code(for: "Optional try") {
    if let number = try? spinWheel() {
        print("The number is \(number)")
    } else {
        print("No number is generated")
    }
}

code(for: "Multiple if let") {
    func submit(name: String?, city: String?, state: String?) -> String {
        if let name = name, let city = city, let state = state {
            return """
            name: \(name)
            city: \(name)
            state: \(state)
            """
        } else {
            return "Missing information"
        }
    }
    let detail = submit(name: "Ram", city: "Coimbatore", state: "Tamil nadu")
    print(detail)
}


code(for: "Nested if let") {
    func submit(name: String?, city: String?, state: String?) -> String {
        if let name = name {
            if let city = city {
                if let state = state {
                    return """
                    name: \(name)
                    city: \(city)
                    state: \(state)
                    """
                } else {
                    return "Missing state"
                }
            } else {
                return "Missing City"
            }
        } else {
            return "Missing name"
        }
    }
    let submit = submit(name: "ram", city: "chennai", state: "tamil nadu")
    print(submit)
    
}


// Optional binding with guard

code(for: "Guard") {
    guard let number = randomOptionInt() else {
        print("No number was generated")
        return
    }
    print("The number is \(number)")
}

code(for: "Multiple guard") {
    func submit(name: String?, city: String?, state: String?) -> String {
        guard let name = name else {
            return "Missing name"
        }
        
        guard let city = city else {
            return "Missing city"
        }

        guard let state = state else {
            return "Missing state"
        }

        return """
        name: \(name)
        city: \(city)
        state: \(state)
        """
    }
    
    let submit = submit(name: "Sharan", city: "Liverloop", state: "London")
    print(submit)
}

func randomWord() -> String? {
    Bool.random() ? ["one", "two", "three"].randomElement() : nil
}

// Nil coalescing operator
code(for: "nil coalescing") {
    let number = randomOptionInt()
    print("The number is \(number ?? 0)")
}

code(for: "nil coalescing 1") {
    let number = randomOptionInt() ?? 0
    print("The number is \(number)")
}

code(for: "random word") {
    let word = randomWord()
    print("My word is \(word ?? "No word returned")")
}


code(for: "random word") {
    let word = randomWord() ?? "No word returned"
    print("My word is \(word)")
}


// Optional chaining

class Parent {
    var name: String
    var child: Child?
    
    init(name: String) {
        self.name = name
    }
}

class Child {
    var name: String
    var pet: Pet?
    
    init(name: String) {
        self.name = name
    }
}

class Pet {
    var name: String?
}

code(for: "optional chaining 1") {
    let parent = Parent(name: "Elon")
    let son = Child(name: "musk")
    parent.child = son
    parent.child?.name ?? "no child"
    
    let pet = Pet()
    son.pet = pet
//    son.pet?.name = "puppy"
//    pet.name = "puppy 1"
    parent.child?.pet?.name = nil
    print("pet name is \(pet.name ?? "no pet")")
}

code(for: "optional chaining 2") {
    let father = Parent(name: "Bill")
    let son = Child(name: "gates")
    father.child = son
    
    guard let _ = father.child else {
        print("No child")
        return
    }
    
    let pet = Pet()
    son.pet = pet
    son.pet?.name = nil
    print("\(son.name)'s pet name is \(pet.name ?? "no pet")")
}


// Extensions
// Extensions add new functionality to an existing class, structure, enumeration, or protocol type.

//Extensions in Swift can:

//Add computed instance properties and computed type properties
//Define instance methods and type methods
//Provide new initializers
//Define subscripts
//Define and use new nested types
//Make an existing type conform to a protocol

// Extension Syntax

extension String {
    // add new functionality here....
}

extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions {
    print("Hi")
}


extension Double {
    
    func convertToFahrenheit() -> Double {
        return ((self * 1.8000) + 32)
    }
    
    func convertToCelsius() -> Double {
        return ((self - 32) / 1.8000)
    }
}

var celsiusTemperature: Double = 23
var fahrenheitTemperature: Double = 63

print(celsiusTemperature.convertToFahrenheit())
print(fahrenheitTemperature.convertToCelsius())

// Before extension
var quote = "  The truth is rarely pure and never simple    "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

// After extension

extension String {
    func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespaces)
    }
}

var quote1 = "  Welcome to swift world  "
quote1.trimmed()


extension User {
    var reversedThing: String {
        return String(name.reversed())
    }
}

class User {
    var name: String
    var gender: String
    
    init(name: String, gender: String) {
        self.name = name
        self.gender = gender
    }
}

let user1 = User(name: "Ram", gender: "male")
print("My name is reversed: \(user1.reversedThing)")


extension Date {
    func CustomDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d h:m a"
        return dateFormatter.string(from: self)
    }
}

let currentDate = Date()
currentDate.CustomDate()
