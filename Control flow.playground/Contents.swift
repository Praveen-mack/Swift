import UIKit

// Control Flow
/*
 Swift provides a variety of control flow statements. These include while loops to perform a task multiple times; if, guard, and switch statements to execute different branches of code based on certain conditions; and statements such as break and continue to transfer the flow of execution to another point in your code.

 Swift also provides a for-in loop that makes it easy to iterate over arrays, dictionaries, ranges, strings, and other sequences.
 */

//For-In Loops

// You use the for-in loop to iterate over a sequence, such as items in an array, ranges of numbers, or characters in a string.

let names = ["Anna", "Alex", "Brain", "jack"]

for name in names {
    print(name)
}

let numberOfLegs = ["spider": 8, "ant": 4, "cat": 46]

for (getKeys, getValues) in numberOfLegs {
    print("\(getKeys) have \(getValues) legs")
}

// With ranges

for index in 1...4 {
    print(index)
}

let base = 5
let power = 10
var answer = 1

for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

let minutes = 60

for mark in 0..<minutes {
    print(mark)
}

let minuteInterval = 7

for tickMark in stride(from: 0, through: minutes, by: minuteInterval) {
    print("\(tickMark) ---- ")
}


// While Loops
// A while loop performs a set of statements until a condition becomes false.
// Types of while lopp
// while loop, repeat-while

// While loop
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +8; board[06] = +11; board[09] = +09; board[10] = +02; board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0

while square < finalSquare {
    diceRoll += 1
    
    if diceRoll == 7 {
        diceRoll = 1
    }
    
    square += diceRoll
    
    if square < board.count {
        square += board[square]
    }
}
print("over")

// Repeat-While
var i = 1, n = 5

repeat {
    i += 1
} while (i <= n)


// Conditional Statements
// If statement

var checkTemperature = 30
if checkTemperature >= 35 {
    print("Too hot")
}

// If else
if checkTemperature >= 35 {
    print("hot")
} else {
    print("cold")
}

// Multiple if statement
if checkTemperature <= 35 {
    print("very cold")
} else if checkTemperature >= 60 {
    print("hot")
} else {
    print("normal")
}

// Switch statement
// A switch statement considers a value and compares it against several possible matching patterns. It then executes an appropriate block of code, based on the first pattern that matches successfully

let internalMark: Int = 100

switch internalMark {
case 0..<30:
    print("horrible")
case 30..<40:
    print("Fail")
case 40..<60:
    print("Not bad")
case 60..<80:
    print("Good")
default:
    print("Excelent")
}

let nameMatching: String = "Praveen"
switch nameMatching {
case "praveen":
    print("Error")
case "Praveen":
    print("Correct")
default:
    print("None all the above")
}

// Switch in Tuples and value binding

let footBallMatch = (1 , 0)

switch footBallMatch {
case (let a, 0):
    print("Cristiano scored \(a) goal")
case (0, 0):
    print("Oponent team lose")
default:
    print("Match draw")
}


let teams = ("psg", "barca")
switch teams {
case (let x, ""), ("", let x):
    print("\(x) won the match")
case (let v, "barca"), (let v, "psg"):
    print("\(v) won the macth")
default:
    print("defaults")
}

// Switch case with Where
let pionts = (1, -2)

switch pionts {
case let (a, b) where a == b:
    print("\(a) : \(b) are equal")
case let (a, b) where a != b:
    print("\(a) : \(b) not equal")
default:
    print("None of the above")
}


// Compound cases
let someCharacter = "p"

switch someCharacter {
case "q","w","r","p":
    print("matched")
case "t","u","d","r":
    print("not matched")
default:
    print("defautls value")
}


// Control Transfer Statements
//Control transfer statements change the order in which your code is executed, by transferring control from one piece of code to another. Swift has five control transfer statements:

//continue
//break
//fallthrough
//return
//throw

// Continue
// The continue statement tells a loop to stop what it’s doing and start again at the beginning of the next iteration through the loop. It says “I am done with the current loop iteration” without leaving the loop altogether.

// Continue allowed only in loop

let countNo = 0

for num in countNo...10 {
    if num == 5 {
        print("num \(num) was excaped and continue")
        continue
    }
    
    print("All done \(num)")
}

// Breaks
// The break statement ends execution of an entire control flow statement immediately. The break statement can be used inside a switch or loop statement when you want to terminate the execution of the switch or loop statement earlier than would otherwise be the case.

var limit = 0

while (limit < 10) {
    limit += 1
    
    if limit == 3 {
        print("we skip the code below this line")
        continue
    } else if limit == 6 {
        print("we break out of the loop")
        break
    }
    
    print("loop \(limit)")
}

// Fallthrough
let checkFall = 4

switch checkFall {
case 1:
    print("1")
case 2:
    print("2")
case 3:
    print("3")
case 4:
    print("4")
    fallthrough
case 5:
    print("5")
case 6:
    print("6")
default:
    print("default")
}

