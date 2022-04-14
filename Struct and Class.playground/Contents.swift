import UIKit

// Structures and Classes

// Structures and classes are general-purpose, flexible constructs that become the building blocks of your program’s code.

// Definition Syntax
// introduce structures with the struct keyword and classes with the class keyword.

struct SomeAboutStruct {
    // Code
}

class SomeAboutClass {
    // Code
}

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var frameRate: Int = 7
    var name: String?
}

let video = VideoMode()


//Structure and Class Instances
// The syntax for creating instances is very similar for both structures and classes:

var someResolution = Resolution()
var someVideoMode = VideoMode()


// Accessing Properties
// You can access the properties of an instance using dot syntax. In dot syntax, you write the property name immediately after the instance name, separated by a period (.), without any spaces:

someResolution.width
someVideoMode.resolution.width

someVideoMode.resolution.width = 120

print(someResolution.width) // Reference type
print(someVideoMode.resolution.width)


// Memberwise Initializers for Structure Types
let structEample = Resolution(width: 5, height: 5)

// Structures and Enumerations Are Value Types
// A value type is a type whose value is copied when it’s assigned to a variable or constant, or when it’s passed to a function.

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2058
print("cinema is now \(cinema.width) pixels wide")

print("hd is still \(hd.width) pixels wide")

// enumerations

enum CompassPoint {
    case north, south, east, west
    
    mutating func turnNorth() {
        self = .north
    }
}
var currentDirection = CompassPoint.west
print(currentDirection)
let rememberedDirection = currentDirection
print(rememberedDirection)
currentDirection.turnNorth()
print(currentDirection)


// Classes Are Reference Types
// reference types are not copied when they’re assigned to a variable or constant, or when they’re passed to a function. Rather than a copy, a reference to the same existing instance is used.

let videos = VideoMode()
videos.resolution = hd
print(video.resolution)
videos.name = "p0i"
videos.frameRate = 24
print(videos.frameRate)

let alsoVideo = videos
alsoVideo.frameRate = 30
print(alsoVideo.frameRate)
print(videos.frameRate)


// Identity Operators
// There are two Identity Operators
// Identical to (===)
// Not identical to (!==)

// Use these operators to check whether two constants or variables refer to the same single instance:

if videos === alsoVideo {
    print("video and alsoVideo refers to the same videoMode")
}

