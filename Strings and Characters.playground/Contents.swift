import UIKit

// Strings and Characters
// A string is a series of characters, such as "hello, world" or "albatross". Swift strings are represented by the String type. The contents of a String can be accessed in various ways, including as a collection of Character values.
// Swift’s String type is bridged with Foundation’s NSString class. Foundation also extends String to expose methods defined by NSString. This means, if you import Foundation, you can access those NSString methods on String without casting.

// String Literals
// You can include predefined String values within your code as string literals. A string literal is a sequence of characters surrounded by double quotation marks (").

// Use a string literal as an initial value for a constant or variable:

let someString = "Some string literal value"

// Multiline String Literals
//If you need a string that spans several lines, use a multiline string literal—a sequence of characters surrounded by three double quotation marks:

let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""

let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""

let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""

print(softWrappedQuotation)

let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""

// Special Characters in String Literals
// String literals can include the following special characters:

// The escaped special characters \0 (null character), \\ (backslash), \t (horizontal tab), \n (line feed), \r (carriage return), \" (double quotation mark) and \' (single quotation mark)
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496

// Extended String Delimiters
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#

// Initializing an Empty String
//To create an empty String value as the starting point for building a longer string, either assign an empty string literal to a variable, or initialize a new String instance with initializer syntax:

var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax
// these two strings are both empty, and are equivalent to each other

//Find out whether a String value is empty by checking its Boolean isEmpty property:

if emptyString.isEmpty {
    print("Nothing to see here")
}
// Prints "Nothing to see here"


// String Mutability
var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage"

let constantString = "Highlander"
//constantString += " and another Highlander" // Error
// this reports a compile-time error - a constant string cannot be modified

// Working with Characters
// You can access the individual Character values for a String by iterating over the string with a for-in loop:

for i in "Praveen" {
    print(i)
}

//Alternatively, you can create a stand-alone Character constant or variable from a single-character string literal by providing a Character type annotation
let exclamationMark: Character = "!"

// String values can be constructed by passing an array of Character values as an argument to its initializer:

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
// Prints "Cat!🐱"

// Concatenating Strings and Characters
// String values can be added together (or concatenated) with the addition operator (+) to create a new String value:

let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
// welcome now equals "hello there"

// You can also append a String value to an existing String variable with the addition assignment operator (+=):

var instruction = "look over"
instruction[instruction.index(after: instruction.startIndex)]
instruction.append(" There")

// You can append a Character value to a String variable with the String type’s append() method:

let exclamationMarks: Character = "!"
welcome.append(exclamationMarks)

// String Interpolation
// String interpolation is a way to construct a new String value from a mix of constants, variables, literals, and expressions by including their values inside a string literal. You can use string interpolation in both single-line and multiline string literals. Each item that you insert into the string literal is wrapped in a pair of parentheses, prefixed by a backslash (\):
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"

// Counting Characters
// To retrieve a count of the Character values in a string, use the count property of the string:

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")
// Prints "unusualMenagerie has 40 characters"


// Accessing and Modifying a String
// String Indices
// Each String value has an associated index type, String.Index, which corresponds to the position of each Character in the string.

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a

//Use the indices property to access all of the indices of individual characters in a string.

for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}
// Prints "G u t e n   T a g ! "

// Inserting and Removing
// To insert a single character into a string at a specified index, use the insert(_:at:) method, and to insert the contents of another string at a specified index, use the insert(contentsOf:at:) method.

var welcomes = "hello"
welcomes.insert("!", at: welcomes.endIndex)
welcomes.insert(contentsOf: " There", at: welcomes.index(before: welcomes.endIndex))

// To remove a single character from a string at a specified index, use the remove(at:) method, and to remove a substring at a specified range, use the removeSubrange(_:) method:
welcomes.remove(at: welcomes.index(before: welcomes.endIndex))

let range = welcomes.index(welcomes.endIndex, offsetBy: -6)..<welcomes.endIndex
welcomes.removeSubrange(range)

// Substrings
let greetings = "Hello, world!"
let indexs = greetings.firstIndex(of: ",") ?? greetings.endIndex
var beginning = greetings[..<indexs]
// beginning is "Hello"

// Convert the result to a String for long-term storage.
let newString = String(beginning)

// Comparing Strings
// Swift provides three ways to compare textual values: string and character equality, prefix equality, and suffix equality.
// String and Character Equality
// Prefix and Suffix Equality

// String and Character Equality
// String and character equality is checked with the “equal to” operator (==) and the “not equal to” operator (!=), as described in Comparison Operators:

let quotations = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotations == sameQuotation {
    print("These two strings are considered equal")
}
// Prints "These two strings are considered equal"

// Prefix and Suffix Equality
// To check whether a string has a particular string prefix or suffix, call the string’s hasPrefix(_:) and hasSuffix(_:) methods, both of which take a single argument of type String and return a Boolean value.

// The examples below consider an array of strings representing the scene locations from the first two acts of Shakespeare’s Romeo and Juliet:

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

//You can use the hasPrefix(_:) method with the romeoAndJuliet array to count the number of scenes in Act 1 of the play:

var act1SceneCount = 0

for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")

//Similarly, use the hasSuffix(_:) method to count the number of scenes that take place in or around Capulet’s mansion and Friar Lawrence’s cell:

var mansionCount = 0
var cellCount = 0

for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}

print("\(mansionCount) mansions scenes, \(cellCount) cell scenes")
