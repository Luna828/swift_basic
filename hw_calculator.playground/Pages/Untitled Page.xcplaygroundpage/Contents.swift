//: [Previous](@previous)

import Foundation

class Person {
    let name: String
    var age : Int
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    
}

let luna = Person(name: "은경", age: 26)
print(luna.name)

let Emily = Person(name: "에밀리", age: 20)
print("\(Emily.name), \(Emily.age)")
