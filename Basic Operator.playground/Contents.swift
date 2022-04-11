import UIKit

var greeting = "Hello, playground"

// Basic Operators --------------------------------
/*
 An operator is a special symbol or phrase that you use to check, change, or combine values. For example, the addition operator (+) adds two numbers, as in let i = 1 + 2, and the logical AND operator (&&) combines two Boolean values, as in if enteredDoorCode && passedRetinaScan.
 */

// Terminology
/*
 Operators are unary, binary, or ternary:

 Unary operators operate on a single target (such as -a). Unary prefix operators appear immediately before their target (such as !b), and unary postfix operators appear immediately after their target (such as c!).
 
 Binary operators operate on two targets (such as 2 + 3) and are infix because they appear in between their two targets.
 
 Ternary operators operate on three targets. Like C, Swift has only one ternary operator, the ternary conditional operator (a ? b : c).
 
 The values that operators affect are operands. In the expression 1 + 2, the + symbol is an infix operator and its two operands are the values 1 and 2.
 */

// Assignment Operator
//The assignment operator (a = b) initializes or updates the value of a with the value of b:

let b = 10
var a = 5
a = b
// a is now equal to 10

//If the right side of the assignment is a tuple with multiple values, its elements can be decomposed into multiple constants or variables at once:

let (x, y) = (1, 2)
// x is equal to 1, and y is equal to 2
//Unlike the assignment operator in C and Objective-C, the assignment operator in Swift doesn’t itself return a value. The following statement isn’t valid:

if x == y {
    // This isn't valid, because x = y doesn't return a value.
}
//This feature prevents the assignment operator (=) from being used by accident when the equal to operator (==) is actually intended. By making if x = y invalid, Swift helps you to avoid these kinds of errors in your code.

// Arithmetic Operators
//Swift supports the four standard arithmetic operators for all number types:

//Addition (+)
//Subtraction (-)
//Multiplication (*)
//Division (/)

1 + 2       // equals 3
5 - 3       // equals 2
2 * 3       // equals 6
10.0 / 2.5  // equals 4.0

//Remainder Operator
//The remainder operator (a % b) works out how many multiples of b will fit inside a and returns the value that’s left over (known as the remainder).
9 % 4

// Unary Minus Operator
//The sign of a numeric value can be toggled using a prefixed -, known as the unary minus operator:

let three = 3
let minusThree = -three       // minusThree equals -3
let plusThree = -minusThree   // plusThree equals 3, or "minus minus three"

//The unary minus operator (-) is prepended directly before the value it operates on, without any white space.

// Unary Plus Operator
//The unary plus operator (+) simply returns the value it operates on, without any change:

let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix equals -6

//Although the unary plus operator doesn’t actually do anything, you can use it to provide symmetry in your code for positive numbers when also using the unary minus operator for negative numbers.


// Compound Assignment Operators

var aa = 1
let result = aa += 2 // The compound assignment operators don’t return a value. For example, you can’t write let b = a += 2.
print(aa)

// Comparison Operators

//Equal to (a == b)
//Not equal to (a != b)
//Greater than (a > b)
//Less than (a < b)
//Greater than or equal to (a >= b)
//Less than or equal to (a <= b)

// Swift also provides two identity operators (=== and !==), which you use to test whether two object references both refer to the same object instance. For more information, see Identity Operators.

//Each of the comparison operators returns a Bool value to indicate whether or not the statement is true:

1 == 1   // true because 1 is equal to 1
2 != 1   // true because 2 isn't equal to 1
2 > 1    // true because 2 is greater than 1
1 < 2    // true because 1 is less than 2
1 >= 1   // true because 1 is greater than or equal to 1
2 <= 1   // false because 2 isn't less than or equal to 1

//Comparison operators are often used in conditional statements, such as the if statement:

let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}
// Prints "hello, world", because name is indeed equal to "world".

// You can compare two tuples if they have the same type and the same number of values. Tuples are compared from left to right, one value at a time, until the comparison finds two values that aren’t equal. Those two values are compared, and the result of that comparison determines the overall result of the tuple comparison. If all the elements are equal, then the tuples themselves are equal. For example:

(1, "zebra") < (2, "apple")   // true because 1 is less than 2; "zebra" and "apple" aren't compared
(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"


// Ternary Conditional Operator
//The ternary conditional operator is a special operator with three parts, which takes the form question ? answer1 : answer2. It’s a shortcut for evaluating one of two expressions based on whether question is true or false. If question is true, it evaluates answer1 and returns its value; otherwise, it evaluates answer2 and returns its value.

//Here’s an example, which calculates the height for a table row. The row height should be 50 points taller than the content height if the row has a header, and 20 points taller if the row doesn’t have a header:

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight is equal to 90

// Nil-Coalescing Operator
// The nil-coalescing operator (a ?? b) unwraps an optional a if it contains a value, or returns a default value b if a is nil. The expression a is always of an optional type. The expression b must match the type that’s stored inside a.

// The example below uses the nil-coalescing operator to choose between a default color name and an optional user-defined color name:

let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"

// If you assign a non-nil value to userDefinedColorName and perform the nil-coalescing operator check again, the value wrapped inside userDefinedColorName is used instead of the default:

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName isn't nil, so colorNameToUse is set to "green"

// Range Operators
//Closed Range Operator
//Half-Open Range Operator
//One-Sided Ranges

//Closed Range Operator
// The closed range operator (a...b) defines a range that runs from a to b, and includes the values a and b. The value of a must not be greater than b.

// The closed range operator is useful when iterating over a range in which you want all of the values to be used, such as with a for-in loop:

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25

// Half-Open Range Operator
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
// Person 1 is called Anna
// Person 2 is called Alex
// Person 3 is called Brian
// Person 4 is called Jack


// One-Sided Ranges
for name in names[2...] {
    print(name)
}
// Brian
// Jack

for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian

for name in names[..<2] {
    print(name)
}
// Anna
// Alex

let range = ...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-1)  // true

// Logical Operator
// Logical operators modify or combine the Boolean logic values true and false.

//Logical NOT (!a)
//Logical AND (a && b)
//Logical OR (a || b)

// Logical NOT Operator
//The logical NOT operator (!a) inverts a Boolean value so that true becomes false, and false becomes true.

//The logical NOT operator is a prefix operator, and appears immediately before the value it operates on, without any white space. It can be read as “not a”, as seen in the following example:

let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"

//Logical AND Operator
//The logical AND operator (a && b) creates logical expressions where both values must be true for the overall expression to also be true.

//If either value is false, the overall expression will also be false. In fact, if the first value is false, the second value won’t even be evaluated, because it can’t possibly make the overall expression equate to true. This is known as short-circuit evaluation.

//This example considers two Bool values and only allows access if both values are true:

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"

//Logical OR Operator
//The logical OR operator (a || b) is an infix operator made from two adjacent pipe characters. You use it to create logical expressions in which only one of the two values has to be true for the overall expression to be true.

let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"

//Combining Logical Operators
// You can combine multiple logical operators to create longer compound expressions:

if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"

