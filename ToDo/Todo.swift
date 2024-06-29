//
//  Todo.swift
//  ToDo
//
//  Created by 김동운 on 6/29/24.
//

import Foundation
import SwiftData

@Model
class Todo: Identifiable {
    let id: UUID
    var title: String
    var isComplicated: Bool
    var detail: String
    
    init(title: String) {
        self.id = UUID()
        self.title = title
        self.isComplicated = false
        self.detail = ""
    }
}
