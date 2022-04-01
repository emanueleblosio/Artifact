//
//  LearnerController.swift
//  
//
//  Created by Emanuele Blosio on 31/03/22.
//

import Fluent
import Vapor

struct LearnerController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let learners = routes.grouped("learners")
        learners.get(use: index)
        learners.post(use: create)
    }
    
    // Learner route
    func index(req: Request) throws -> EventLoopFuture<[Learner]> {
    return Learner.query(on: req.db).all()
    }
    
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let learner = try req.content.decode(Learner.self)
        return learner.save(on: req.db).transform(to: .ok)
    }
}
