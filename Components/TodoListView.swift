//
//  TodoListView.swift
//  swift-practice
//
//  Created by 유도혁 on 2022/06/04.
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject var todoLists: TodoLists
    
    func toggleTodoChecked(_ idx: Int) {
        todoLists.list[idx].isChecked.toggle()
    }
    
    func removeTodo(_ idx: Int) {
        todoLists.list.remove(at: idx)
    }
    
    var body: some View {
        List {
            ForEach(0..<todoLists.list.count, id: \.self) { idx in
                HStack {
                    Button(action: {toggleTodoChecked(idx)}, label: {
                        Image(systemName: todoLists.list[idx].isChecked ? "checkmark.square" : "square")
                    })
                    Text(todoLists.list[idx].title)
                    Spacer()
                    Button(action: {removeTodo(idx)}, label: {
                        Image(systemName: "trash")
                    })
                }.buttonStyle(BorderlessButtonStyle())
            }
            
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
