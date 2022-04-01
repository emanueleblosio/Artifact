//
//  CreateLearners.swift
//  
//
//  Created by Emanuele Blosio on 31/03/22.
//

import Fluent

struct CreateLearners: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("learners")
            .id()
            .field("name", .string, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("learners").delete()
    }
    
    
}
