//
//  UserDatabase.swift
//  Project_Group_12
//
//  Created by Yuk Fai Hsu on 2022-04-03.
//

import Foundation

class UserDatabase{
    static let shared = UserDatabase()
    
    private init(){}
    
    private var usersList:[User] = [
        //Initialising users
        User(email: "samarthjoshi99@gmail.com", password: "samarth"),
        User(email: "daniel456@gmail.com", password: "daniel"),
        User(email: "1", password: "1")]
    
    func getAllUsers() -> [User]{
        return self.usersList
    }
}
