import UIKit

// Subscripts

// Classes, structures, and enumerations can define subscripts, which are shortcuts for accessing the member elements of a collection, list, or sequence.
// A class or structure can provide as many subscript implementations as it needs.
// This definition of multiple subscripts is known as subscript overloading.

// Subscript Syntax

struct firstExample {
    subscript(index: Int) -> Int {
        get {
            // code
            return 0
        }
        set {
            // code
        }
    }
}

// As with read-only computed properties, you can simplify the declaration of a read-only subscript by removing the get keyword and its braces:


//    subscript(index: Int) -> Int {
//        // Code
//    }


struct TimesTable {
    var multiplies: Int
    
    subscript(index: Int) -> Int {
        return multiplies * index
    }
}
let threeTimes = TimesTable(multiplies: 6)
threeTimes[6]


// Subscript Usage
// Subscripts are typically used as a shortcut for accessing the member elements in a collection, list, or sequence. You are free to implement subscripts in the most appropriate way for your particular class or structure’s functionality.


struct Classroom {
    var data = [
        ["Messi", "Ronaldo", "Xavi"],
        ["Mbappe", "Neymar", "Ramos"],
        ["Pedri", "Karim", "Gavi"]
    ]
    
    subscript(row: Int, col: Int) -> String {
        get {
            return data[row][col]
        }
        
        set {
            data[row][col] = newValue
        }
    }
}

var firstClass = Classroom()
firstClass[0, 0]
firstClass[0, 0] = "Lionel Messi"
firstClass[0, 0]


struct Grid<T> {
    var data: [[T]] = []
    
    subscript(row: Int, column: Int) -> T {
        get {
            return data[row][column]
        }
        
        set {
            data[row][column] = newValue
        }
    }
}

var grid = Grid(
    data: [
    [1,2,3],
    [4,5,6],
    [7,8,9]
    ]
)

grid[0, 1]
grid[0, 1] = 122
grid[0, 1]
