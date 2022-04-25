import UIKit

// Protocols
// A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol.

protocol Purchasable {
    var name: String { get }
    var price: Float { get set }
    func purchase()
}

class Book: Purchasable {
    var numberOfPages: Int
    var name: String
    var price: Float
    
    init(numberOfPages: Int, name: String, price: Float) {
        self.numberOfPages = numberOfPages
        self.name = name
        self.price = price
    }
    
    func purchase() {
        print("I purchased this book called \(name) for \(price)")
    }
}

class VideoGame: Purchasable {
    var isOnlineMode: Bool
    var price: Float
    var name: String
    
    init(isOnlineMode: Bool, price: Float, name: String) {
        self.isOnlineMode = isOnlineMode
        self.price = price
        self.name = name
    }
    
    func purchase() {
        print("You purchased a video game called \(self.name)")
    }
}

let book1 = Book(numberOfPages: 400, name: "Intro to swift", price: 64.76)
let book2 = Book(numberOfPages: 300, name: "Vapor server side", price: 34.7)

let videoGame1 = VideoGame(isOnlineMode: true, price: 356.2, name: "GTA 5")
let videoGame2 = VideoGame(isOnlineMode: true, price: 255.15, name: "Uncharted")


// Protocol Syntax

protocol ExampleProtocol {
    // protocol definition goes here
}

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}
let john = Person(fullName: "John")


class Starship: FullyNamed {
    var prefixs: String?
    var name: String
    
    init(name: String, prefixs: String? = nil) {
        self.name = name
        self.prefixs = prefixs
    }
    
    var fullName: String {
        return (prefixs != nil ? prefixs! + " " : "") + name
    }
}
var starship = Starship(name: "Enterprise", prefixs: "Uss")
print(starship.fullName)


class Employee {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func getEmployeeDetails() {
        print("Name: \(name)")
    }
}

class IosDeveloper: Employee {
    
    func getSkills() {
        print("Swift and Xcode")
    }
}

class DevOps: Employee {
    
    func getSkills() {
        print("Jenkins")
    }
}

let iosDev = IosDeveloper(name: "Ram")
iosDev.getEmployeeDetails()
iosDev.getSkills()


protocol PlayerProtocol {
    var hitPoint: Int { get }
    var name: String { get }
    init(playerName: String, startingHealth: Int)
    mutating  func takeDamage(damage: Int)
}

extension PlayerProtocol {
    func isAlive() -> Bool {
        return hitPoint > 0
    }
}

protocol MagicProtocol: PlayerProtocol {
    func castFirebasll() -> Int
    func castIceBolt() -> Int
    func castCurse() -> Int
}

protocol BossProtocol {
    func castSuperAttack() -> Int
    mutating func regenerateSomeHealth()
}

struct Wizard: MagicProtocol {
    var hitPoint: Int
    
    var name: String
    
    init(playerName: String, startingHealth: Int) {
        self.name = playerName
        self.hitPoint = startingHealth
    }
    
    mutating func takeDamage(damage: Int) {
        hitPoint -= damage
    }
    
    func castFirebasll() -> Int {
        return 5
    }
    
    func castIceBolt() -> Int {
        return 2
    }
    
    func castCurse() -> Int {
        return 7
    }
}

struct MiniBoss: PlayerProtocol, BossProtocol {
    var hitPoint: Int
    
    var name: String
    
    init(playerName: String, startingHealth: Int) {
        self.name = playerName
        self.hitPoint = startingHealth
    }
    
    mutating func takeDamage(damage: Int) {
        hitPoint -= damage
    }
    
    func castSuperAttack() -> Int {
        return 10
    }
    
    mutating func regenerateSomeHealth() {
        hitPoint += 5
    }
    
    
}

extension BossProtocol {
    func tauntPlayer() {
        print("I'm going to crush you!")
    }
}

class FinalBoss: PlayerProtocol, MagicProtocol, BossProtocol {
    var hitPoint: Int
    
    var name: String
    
    required init(playerName: String, startingHealth: Int) {
        self.name = playerName
        self.hitPoint = startingHealth
    }
    
    func takeDamage(damage: Int) {
        hitPoint -= damage
    }
    
    func castFirebasll() -> Int {
        return 20
    }
    
    func castIceBolt() -> Int {
        return 12
    }
    
    func castCurse() -> Int {
        return 30
    }
    
    func castSuperAttack() -> Int {
        return 45
    }
    
    func regenerateSomeHealth() {
        hitPoint += 45
    }
}

class MainPlayer: MagicProtocol {
    func castFirebasll() -> Int {
        return 8
    }
    
    func castIceBolt() -> Int {
        return 3
    }
    
    func castCurse() -> Int {
        return 3
    }
    
    var hitPoint: Int
    
    var name: String
    
    required init(playerName: String, startingHealth: Int) {
        name = playerName
        hitPoint = startingHealth
    }
    
    func takeDamage(damage: Int) {
        hitPoint -= damage
    }
}

var miniBoss = MiniBoss(playerName: "Mini-boss", startingHealth: 100)
miniBoss.tauntPlayer()

var finalBoss = FinalBoss(playerName: "final-boss", startingHealth: 200)
finalBoss.tauntPlayer()

var mainPlayer = MainPlayer(playerName: "main-player", startingHealth: 1000)

while miniBoss.isAlive() {
    miniBoss.takeDamage(damage: mainPlayer.castFirebasll())
    mainPlayer.takeDamage(damage: miniBoss.castSuperAttack())
}

print("Mini boss has been defeated")

while finalBoss.isAlive() {
    finalBoss.takeDamage(damage: mainPlayer.castCurse())
    mainPlayer.takeDamage(damage: finalBoss.castIceBolt())
}

print("Final boss has been defeated")

if mainPlayer.isAlive() {
    print("The main player has defeated his enemies with \(mainPlayer.hitPoint) hit points remaining!")
}
