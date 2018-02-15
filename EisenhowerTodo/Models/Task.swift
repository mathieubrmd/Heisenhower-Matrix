//
//  Task.swift
//  EisenhowerTodo
//
//  Created by Mathieu Bourmaud on 08/02/2018.
//  Copyright © 2018 Mathieu Bourmaud. All rights reserved.
//

import Foundation

struct Task {
    let title: String
    let description: String
    let dueDate: Date
    let createdAt: Date
    let createdBy: String
    let assignedTo: String
    let completed: Bool
    let urgent: Bool
    let important: Bool
}
