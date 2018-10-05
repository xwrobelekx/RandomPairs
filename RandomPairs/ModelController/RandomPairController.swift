//
//  RandomPairController.swift
//  RandomPairs
//
//  Created by Kamil Wrobel on 10/5/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import Foundation




class RandomPairController {
    
    //MARK: - Shared Instance
    static let shared = RandomPairController()
    private init() {}
    
    
    
    
    //MARK: - Source of truth
    var randomPeople : [RandomPerson] = []{
        didSet{
            determineNumberOfRowInSectionFrom(arrayOfPeople: RandomPairController.shared.randomPeople)
        }
    }
    
    //MARK: - Groups
    var numberOfRowsAtSection : [Int] = []
    
    func determineNumberOfRowInSectionFrom(arrayOfPeople: [RandomPerson]){
        var howManyTimesINeedToAddTwo = 0
        if arrayOfPeople.count % 2 == 1 {
            howManyTimesINeedToAddTwo = (arrayOfPeople.count-1) / 2
        } else {
            howManyTimesINeedToAddTwo = arrayOfPeople.count/2
        }
        for _ in 0..<howManyTimesINeedToAddTwo {
            numberOfRowsAtSection.append(2)
        }
        if arrayOfPeople.count % 2 == 1 {
            numberOfRowsAtSection.append(1)
        }
    }
    
    //MARK: - Crud Functions
    
    func save(person: RandomPerson) {
        randomPeople.append(person)
        
    }
    
    
    func delete(person: RandomPerson) {
//        let index = randomPeople
//        randomPeople
//        
    }
    
    
    
    
}
