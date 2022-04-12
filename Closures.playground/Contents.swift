import UIKit
import Foundation

// Closures:- reference type
// Closures is a function, and we can pass that as a parameter
// Closures are self-contained blocks of functionality that can be passed around and used in your code.

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

var reverseName = names.sorted { s1, s2 in
    return s1 < s2
}


// Closure Expression Syntax
/*
{ (parameter) -> returnType in
    // code
}
*/

// The parameters in closure expression syntax can be in-out parameters, but they can’t have a default value. Variadic parameters can be used if you name the variadic parameter. Tuples can also be used as parameter types and return types.

reverseName = names.sorted(by: { (n1: String, n2: String) -> Bool in
    return n1 < n2
})

// The start of the closure’s body is introduced by the in keyword. This keyword indicates that the definition of the closure’s parameters and return type has finished, and the body of the closure is about to begin.


// Inferring Type From Context
// The sorted(by:) method is being called on an array of strings, so its argument must be a function of type (String, String) -> Bool. This means that the (String, String) and Bool types don’t need to be written as part of the closure expression’s definition. Because all of the types can be inferred, the return arrow (->) and the parentheses around the names of the parameters can also be omitted:

reverseName = names.sorted(by: { s1, s2 in return s1 < s2})
print(reverseName)


// Implicit Returns from Single-Expression Closures

reverseName = names.sorted(by: { s1, s2 in s1 < s2 })


// Shorthand Argument Names
// Swift automatically provides shorthand argument names to inline closures, which can be used to refer to the values of the closure’s arguments by the names $0, $1, $2, and so on.

reverseName = names.sorted(by: { $0 < $1 })

// $0 and $1 refer to the closure’s first and second String arguments. Because $1 is the shorthand argument with highest number, the closure is understood to take two arguments. Because the sorted(by:) function here expects a closure whose arguments are both strings, the shorthand arguments $0 and $1 are both of type String.


//Example
// Normal function
func addTwoNumber(num1: Int, num2: Int) -> Int {
    return num1 + num2
}

var additionOfTwoNumber = addTwoNumber

let result = additionOfTwoNumber(1,10)
print(result)

// Closure
let addClosure: (Int, Int) -> Int = addTwoNumber(num1:num2:)
addClosure(3,5)

var addInClosure: (Int, Int) -> Int = { (n1, n2) in
    return n1 + n2
}
addInClosure(2,2)

// Body start with { and end with }, and in keyword indicates that code logic is begin.

let result1 = addInClosure(3,3)

let addition: (Int, Int) -> Int = { n1, n2 in
    n1 + n2
}

func calculate(num1: Int, num2: Int, add: (Int, Int) -> Int) {
    let result = add(num1, num2)
    print(result)
}
calculate(num1: 10, num2: 10, add: addition)

// Closure :- is a function
// Syntax
// typealias with closure syntax
// function call sequence with closure
// autoclosure
// escaping and non-escaping

// Syntax
func greet(s1: String, s2: String) -> String {
    return "\(s1), \(s2)"
}

var name: (_ s1: String,_ s2: String) -> String = { s1, s2 in
     return s1 + " " + s2
}
var result2 = name("one","two")


// typealias
// when to use typealias: Same expression are used more than 2 times we can use typealias
typealias addString = (String, String) -> String

let addTwoString: addString = { s1, s2 in
    return "\(s1) and \(s2)"
}

let takeString = addTwoString("first", "second")
debugPrint(takeString)


// function call sequence with closure

func exampleForNetworkCalls(success: Bool, callApi: () -> String) {
    if success {
        print("\(success), now we can run our api calls")
        print("\(callApi())")
    } else {
        print("\(success), no api calls")
    }
}

func callApi(message: String) -> String {
    return message
}

exampleForNetworkCalls(success: true) { () -> String in
    callApi(message: "Api fetching....")
}

exampleForNetworkCalls(success: false) {
    callApi(message: "Api fetching....")
}

// Autoclosure

func exampleForNetworkCallsforAutoClosure(success: Bool, callApi:@autoclosure () -> String) {
    if success {
        print("\(success), now we can run our api calls")
        print("\(callApi())")
    } else {
        print("\(success), no api calls")
    }
}

func callApiforAutoClosure(message: String) -> String {
    return message
}

exampleForNetworkCallsforAutoClosure(success: true, callApi: callApiforAutoClosure(message: "Api fetching..."))

// name parameter expect string value not a closure, becuase we are using @autoClosure.

// escaping and non-escaping
// Default closure are: @non-escaping types.
// non-escaping: - call the closure before function returns, no need to allocate any memory.
// escaping: - first it's gonna return function, then closure runs afterthat.
// memory will be allocatted for @escaping closure so that it can run later.


// Trailing Closures
// Example
func trailingClosure(closure: () -> Void) {
        // body
}

// Calling a trailing closure function
trailingClosure {
    // body
}

// Calling without trailing closure
trailingClosure(closure: {
    // body
})

func fetchDataFromApi(from api: Bool, completion: (String) -> Void, error: (String) -> Void) {
    if api {
        let message = "Success!"
        completion(message)
    } else {
        let message = "Error"
        error(message)
    }
}
fetchDataFromApi(from: true) { status in
    print("Api is running \(status)")
} error: { err in
    print("\(err) while fetching data")
}

