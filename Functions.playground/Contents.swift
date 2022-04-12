import UIKit

// Functions
/*
 Functions are self-contained chunks of code that perform a specific task. You give a function a name that identifies what it does, and this name is used to “call” the function to perform its task when needed.
 */

// Defining and Calling Functions
// You indicate the function’s return type with the return arrow -> (a hyphen followed by a right angle bracket), which is followed by the name of the type to return.

func greet(person: String) -> String {
    return "Hi \(person)!"
}
greet(person: "Praveen") // calling a func

// Function Parameters and Return Values
// Functions Without Parameters
// Functions With Multiple Parameters

// Functions Without Parameters

func saySomeThing() -> String {
    return "Good morning!!!"
}
saySomeThing()

// Functions With Multiple Parameters

func personsDetails(name: String, age: Int) -> String {
    return "Hi my name is \(name) and I'm \(age) years old."
}
personsDetails(name: "Sam", age: 30)

// Functions Without Return Values

func funcWithoutReturnType(from: Int, to: Int) {
    for _ in from...to {
        print("There are multiple values inside this function")
    }
}
funcWithoutReturnType(from: 0, to: 10)

// function does still return a value, even though no return value is defined. Functions without a defined return type return a special value of type Void. This is simply an empty tuple, which is written as ().

// The return value of a function can be ignored when it’s called

func returnCounts(name: String) -> Int {
    return name.count
}

func sendName(name: String) {
    let _ = returnCounts(name: name)
}
sendName(name: "Praveen")

// Functions with Multiple Return Values
// You can use a tuple type as the return type for a function to return multiple values as part of one compound return value.

func calculateMinAndMax(values: [Int]) -> (min: Int, max: Int) {
    var currentMin = values[0]
    var currentMax = values[0]
    
    for i in values[1..<values.count] {
        if i < currentMin {
            currentMin = i
        } else if i > currentMax {
            currentMax = i
        }
    }
    
    return (currentMin, currentMax)
}

let result = calculateMinAndMax(values: [4,72,86,5,94,3])
print("min is \(result.min) and max is \(result.max)")

// Note that the tuple’s members don’t need to be named at the point that the tuple is returned from the function, because their names are already specified as part of the function’s return type.


// Optional Tuple Return Types
// If the tuple type to be returned from a function has the potential to have “no value” for the entire tuple, you can use an optional tuple return type to reflect the fact that the entire tuple can be nil. You write an optional tuple return type by placing a question mark after the tuple type’s closing parenthesis

// (Int, Int)? or (String, Int, Bool)?

// An optional tuple type such as (Int, Int)? is different from a tuple that contains optional types such as (Int?, Int?). With an optional tuple type, the entire tuple is optional, not just each individual value within the tuple.

// To handle an empty array safely, write the minMax(array:) function with an optional tuple return type and return a value of nil when the array is empty:

func calculateMinAndMax1(values: [Int]) -> (min: Int, max: Int)? {
    guard values.isEmpty != nil else { return nil }
    var currentMin = values[0]
    var currentMax = values[0]
    
    for i in values[1..<values.count] {
        if i < currentMin {
            currentMin = i
        } else if i > currentMax {
            currentMax = i
        }
    }
    
    return (currentMin, currentMax)
}

let result1 = calculateMinAndMax1(values: [4,72,86,5,94,3])
print("min is \(result.min) and max is \(result.max)")


// Functions With an Implicit Return
func welcome(person: String) -> String { // Any function that you write as just one return line can omit the return.
    "Hello \(person)"
}

func welcome1(person: String) -> String {
    return "Hello \(person)"
}


// Function Argument Labels and Parameter Names
// Each function parameter has both an argument label and a parameter name. The argument label is used when calling the function; each argument is written in the function call with its argument label before it. The parameter name is used in the implementation of the function. By default, parameters use their parameter name as their argument label.

// Specifying Argument Labels
// You write an argument label before the parameter name, separated by a space:

func argumentLabelFunction(argumentLabl parameter: String) {
    // In the function body, parameterName refers to the argument value
        // for that parameter.
}

// Example

func greetPerson(person: String, from hometown: String) -> String {
    return "Hello \(person)! You are visited from \(hometown)"
}
greetPerson(person: "Praveen", from: "Ooty")


// Omitting Argument Labels
// If you don’t want an argument label for a parameter, write an underscore (_) instead of an explicit argument label for that parameter.

func exampleForOmittingArgumentLabels(_ firstPara: String, secondPara: String) {
    // In the function body, firstParameterName and secondParameterName
        // refer to the argument values for the first and second parameters.
}
exampleForOmittingArgumentLabels("first", secondPara: "second")


// Default Parameter Values
// You can define a default value for any parameter in a function by assigning a value to the parameter after that parameter’s type. If a default value is defined, you can omit that parameter when calling the function.

func defaultParameter(first: Int, second: Int = 10) {
    // If you omit the second argument when calling this function, then
        // the value of parameterWithDefault is 10 inside the function body.
}
defaultParameter(first: 2)
defaultParameter(first: 2, second: 5) // Now second paramter is 5.


// Variadic Parameters
// A variadic parameter accepts zero or more values of a specified type. You use a variadic parameter to specify that the parameter can be passed a varying number of input values when the function is called. Write variadic parameters by inserting three period characters (...) after the parameter’s type name.

// A function can have multiple variadic parameters. The first parameter that comes after a variadic parameter must have an argument label.

func variadicParameter(_ number: Int...) {
    for i in number {
        print(i)
    }
}
variadicParameter(1,2,4,4,2,7,5,56,5)


// In-Out Parameters
// Function parameters are constants by default. Trying to change the value of a function parameter from within the body of that function results in a compile-time error. This means that you can’t change the value of a parameter by mistake. If you want a function to modify a parameter’s value, and you want those changes to persist after the function call has ended, define that parameter as an in-out parameter instead.

// You write an in-out parameter by placing the inout keyword right before a parameter’s type.
// An in-out parameter has a value that’s passed in to the function, is modified by the function, and is passed back out of the function to replace the original value
// In-out parameters can’t have default values, and variadic parameters can’t be marked as inout.

var c = 2

func makeInout(number: inout Int) {
    number *= 2
}
makeInout(number: &c)
print(c)


// Nested Functions
// You can also define functions inside the bodies of other functions, known as nested functions.

func myFunction1() {
    
    func myFuntion2() {
        print("Inner function")
    }
    
    // Calling inner function inside of the outer function
    myFuntion2()
}

myFunction1()


func addNestedFunction(num1: Int, num2: Int) {
    
    func innerFunctionPrintSum(sum: Int) {
        print("Sum of \(num1) and \(num2) is equal to , \(sum)")
    }
    
    let total = num1 + num2
    
    innerFunctionPrintSum(sum: total)
}

addNestedFunction(num1: 4, num2: 5)



