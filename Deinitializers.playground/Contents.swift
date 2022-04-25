import UIKit

// Deinitialization

// A deinitializer is called immediately before a class instance is deallocated. You write deinitializers with the deinit keyword. Deinitializers are only available on class types.

// Class definitions can have at most one deinitializer per class. The deinitializer doesn’t take any parameters and is written without parentheses:

/*
deinit {
    // Deinitialization
}
 */


// Create a deinitializer for a class
/*
1. You don't use func with deinitializer.
2. Deinitializer can never take parameters or return data.
3. Deinitializers run when the last copy of a class instance is destroyed.
4. We never call deinitializers directly.
5. Structs don't have deinitializer
*/

class Entity {
    
    init() {
        print("initializer is called, your all properties are initialised with default values!")
    }
    
    func printData() {
        print("Data")
    }
    
    deinit {
        print("Deinitialization called")
    }
}
var entity: Entity? = Entity()
entity?.printData()
entity = nil


class User {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive")
    }
    
    deinit {
        print("User \(id): I'm dead")
    }
}

var users = [User]()

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control")
    users.append(user)
}

print("Loop is finished")
users.removeAll()
print("Array is clear")

// Example 1

class Person {
    var name: String
    
    init(name: String) {
        self.name = name
        print("init method of persons class called")
    }
    
    func printName() {
        print("name is \(name)")
    }
    
    deinit {
        print("deinit called for person class")
    }
}

var person1: Person?
var person2: Person?

if 1 == 1 {
    let person = Person(name: "Sam")
    person1 = person
    person2 = person
    person.printName()
}

person1 = nil
person2 = nil


// Example 2
   
class Person1 {
    var name: String
    weak var job: Job?
    
    init(name: String) {
        self.name = name
        print("init method of persons class called")
    }
    
    deinit {
        print("deinit called for person class")
    }
}

class Job {
    var jobDescription: String
    weak var person: Person1?
    
    init(jobName: String) {
        jobDescription = jobName
        print("init method of job called")
    }
    
    deinit {
        print("deinit called for job class")
    }
}

if 1 == 1 {
    let objPerson = Person1(name: "Arcade")
    let objJob = Job(jobName: "Swift programmer")
    
    objPerson.job = objJob
    objJob.person = objPerson
}
