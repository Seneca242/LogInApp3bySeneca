//
//  User.swift
//  LogInApp3bySeneca
//
//  Created by Дмитрий Дмитрий on 03.12.2021.
//

struct User {
    let userName: String
    let password: String
    let person: Person
    
    static func getUserInfo() -> User {
        User(
            userName: "Dima",
            password: "123",
            person: Person.getpersonInfo()
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let email: String
    let image: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getpersonInfo() -> Person {
        Person(
            name: "Seneca",
            surname: "Lucius",
            email: "seneca@philosophy.com",
            image: "imageName")
    }
}
