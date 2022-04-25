import Foundation


// Initialization

// Initialization is the process of preparing an instance of a class, structure, or enumeration for use. This process involves setting an initial value for each stored property on that instance and performing any other setup or initialization that’s required before the new instance is ready for use.

// Setting Initial Values for Stored Properties
// Classes and structures must set all of their stored properties to an appropriate initial value by the time an instance of that class or structure is created. Stored properties can’t be left in an indeterminate state.

// Initializers
/*
init() {
    
}
 */

struct Fahrenheit {
    var temperature: Double
    
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)")


// Example
// Fixing error with default values
class Person {
    var name: String = "Ram"
    var age: Int = 18
    var email: String?
    var nationality = "India"
}
let p = Person()
p.email = "example@gmail.com"


// Create an initializer for those properties that do not have a default value, or which are optional.
class Person2 {
    var name: String
    var age: Int
    var email: String?
    var nationality = "India"
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
let p2 = Person2(name: "Ram", age: 20)


// Argument Labels

class Person3 {
    var name: String
    var age: Int
    var email: String?
    var nationality = "India"
    
    init(defaultName name: String, _ age: Int) {
        self.name = name
        self.age = age
        print("\(name) was created")
    }
}
let p3 = Person3(defaultName: "Ram", 12)
p3.age

// Working with static properties
class Person4 {
    var name: String
    var age: Int
    var email: String?
    var nationality = "India"
    static var total = 0
    
    init(defaultName name: String, _ age: Int) {
        self.name = name
        self.age = age
        Self.total += 1
        print("\(name) was created")
    }
}
let p4 = Person4(defaultName: "Ram", 12)
let p44 = Person4(defaultName: "Sam", 12)
Person4.total


// Properties with optional default values
class Person5 {
    var name: String
    var age: Int
    var email: String?
    var nationality: String
    
    init(name: String, age: Int, email: String? = "amazom@gmail.com" ,nationality: String = "India") {
        self.name = name
        self.age = age
        self.email = email
        self.nationality = nationality
    }
}
let p5 = Person5(name: "Ram", age: 3)
let p55 = Person5(name: "Sam", age: 5, nationality: "American")
let p5a = Person5(name: "Ram", age: 53, nationality: "India")
p5a.email


// Multiple Designated Initializers

class Person6 {
    var name: String
    var age: Int
    var email: String?
    var nationality: String
    
    // Default dog to nil but requires all other arguments
    init(name: String, age: Int, nationality: String) {
        self.name = name
        self.age = age
        self.nationality = nationality
    }
    
    // All 4 argument required
    init(name: String, age: Int, email: String?, nationality: String) {
        self.name = name
        self.age = age
        self.email = email
        self.nationality = nationality
    }
    
    // Defaults dog to nil and nationality to canadian
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        self.nationality = "Canadian"
    }
    
    // Defaults nationality to canadian but requires a dog breed
    init(name: String, age: Int, email: String?) {
        self.name = name
        self.age = age
        self.email = email
        self.nationality = "India"
    }
    
}
let p6 = Person6(name: "ram", age: 34, email: "email")


// Default Property Values
// You can write the Fahrenheit structure from above in a simpler form by providing a default value for its temperature property at the point that the property is declared:

struct Fahrenheit1 {
    var temperatur = 32.0
}


// Customizing Initialization
// Initialization Parameters

struct Celsius {
    var temperature: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        temperature = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperature = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)


// Parameter Names and Argument Labels

struct Colors {
    let red, green, blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let magneta = Colors(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Colors(white: 1.0)

// Initializer Parameters Without Argument Labels

struct Celsius1 {
    var temperature: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        temperature = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperature = kelvin - 273.15
    }
    
    init(_ celsius: Double) {
        temperature = celsius
    }
}

let celsius = Celsius1(37.0)

// Optional Property Types
class SurveyQuestion {
    var text: String
    var response: String?
    
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like football")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes! i do like football"

// Default Initializers
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()


struct ShoppingListItem1 {
    var name: String
    var quantity: Int
    var purchased: Int
}
var item1 = ShoppingListItem1(name: "Ram", quantity: 4, purchased: 134)

// Memberwise Initializers for Structure Types

