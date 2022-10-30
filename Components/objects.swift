//
//  objects.swift
//  swift-practice
//
//  Created by 유도혁 on 2022/06/04.
//

import Foundation

struct TodoList: Identifiable, Codable {
    let id = UUID()
    var title: String
    var content: String
    var isChecked: Bool
}
struct TodoLists: ObservableObject {
    @Published var list: [TodoList]() {
        didSet {
            saveTodoList()
        }
    }
}
