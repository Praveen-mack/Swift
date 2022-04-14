import UIKit

// Enumerations
// An enumeration defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code.

// Enumeration Syntax
enum someEnumeration {
    // Code
}

enum CompassPoint {
    case north, south, east, west
}
// The values defined in an enumeration (such as north, south, east, and west) are its enumeration cases. You use the case keyword to introduce new enumeration cases.

var directionHead = CompassPoint.west

directionHead = .north


// Matching Enumeration Values with a Switch Statement

directionHead = .south

switch directionHead {
case .north:
    print("north")
case .south:
    print("south")
case .east:
    print("east")
case .west:
    print("west")
default:
    print("default")
}


// Iterating over Enumeration Cases
// it’s useful to have a collection of all of that enumeration’s cases. You enable this by writing : CaseIterable after the enumeration’s name. Swift exposes a collection of all the cases as an allCases property of the enumeration type.

enum Beverage: CaseIterable {
    case coffee, tea, juice
}

// enumeration as conforming to the CaseIterable protocol

let numberOfChoice = Beverage.allCases.count
print("\(numberOfChoice) beverages are available")

// you write Beverage.allCases to access a collection that contains all of the cases of the Beverage enumeration.

for beverage in Beverage.allCases {
    print(beverage)
}

// Associated Values

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
// “Define an enumeration type called Barcode, which can take either a value of upc with an associated value of type (Int, Int, Int, Int), or a value of qrCode with an associated value of type String.”

// This definition doesn’t provide any actual Int or String values—it just defines the type of associated values that Barcode constants and variables can store when they’re equal to Barcode.upc or Barcode.qrCode.

var barcodeProduct = Barcode.upc(8, 7899, 7779, 9)

barcodeProduct = .qrCode("havdkoiorbasbckj")

switch barcodeProduct {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("\(numberOfChoice), \(manufacturer), \(product), \(check)")
case .qrCode(let productCode):
    print("\(productCode)")
}

// You extract each associated value as a constant (with the let prefix) or a variable (with the var prefix) for use within the switch case’s body.

// If all of the associated values for an enumeration case are extracted as constants, or if all are extracted as variables, you can place a single var or let annotation before the case name, for brevity:

switch barcodeProduct {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}


// Raw Values
// As an alternative to associated values, enumeration cases can come prepopulated with default values (called raw values), which are all of the same type.

enum ASCIICharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

// Raw values can be strings, characters, or any of the integer or floating-point number types. Each raw value must be unique within its enumeration declaration.


// Implicitly Assigned Raw Values
// when integers are used for raw values, the implicit value for each case is one more than the previous case. If the first case doesn’t have a value set, its value is 0.

enum Planet: Int, CaseIterable {
    case mercury = 0, venus = 3, earth, mars, jupiter, saturn, uranus, neptune
}
let earthsOrder = Planet.earth.rawValue

// When strings are used for raw values, the implicit value for each case is the text of that case’s name.

enum StringEnumTeam: String {
    case liverpool, manchester_city, psg, arsenal
}
let enumTeam = StringEnumTeam.liverpool.rawValue
print(enumTeam)






