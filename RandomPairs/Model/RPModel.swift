//
//  RPModel.swift
//  RandomPairs
//
//  Created by Kamil Wrobel on 10/5/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import Foundation

class RandomPerson {
    let firstName: String
    let lastName: String
    
    init(firstName: String, lastName: String){
        self.firstName = firstName
        self.lastName = lastName
    }
}



extension RandomPerson : Equatable{
    static func ==(lhs: RandomPerson, rhs: RandomPerson) -> Bool{
        if lhs.firstName != rhs.firstName {return false}
        if lhs.lastName != rhs.lastName {return false}
        return true
    }
}
