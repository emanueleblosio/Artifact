//
//  Learner.swift
//  
//
//  Created by Emanuele Blosio on 31/03/22.
//

import Fluent
import Vapor


final class Learner: Model, Content {
    
    static let schema = "learners"

    @ID(key: .id)
    var id : UUID?
     
    @Field(key: "name")
    var name : String

    
    init() {}
    
    init(id: UUID? = nil, name: String) {
        
        self.id = id
        self.name = name
        
    }
}
