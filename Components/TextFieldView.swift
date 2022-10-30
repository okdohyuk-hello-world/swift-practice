//
//  TextField.swift
//  swift-practice
//
//  Created by 유도혁 on 2022/06/04.
//

import SwiftUI

struct TextFieldView: View {
    @State private var todoString = ""
    @EnvironmentObject var todoLists : TodoLists
    
    func addNewTodo() {
        let newTodo = TodoList(title: todoString, content: "", isChecked: false)
        todoLists.list.append(newTodo)
        todoString = ""
    }
    
    var body: some View {
        HStack {
            Image(systemName: "square.and.pencil")
            TextField("your task", text: $todoString,  onCommit: {
                addNewTodo()
            })
        }
        .textFieldStyle(DefaultTextFieldStyle())
        .frame(width: 300, height: 50, alignment: .center)
    }
}

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
