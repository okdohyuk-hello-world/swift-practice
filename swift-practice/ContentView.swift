//
//  ContentView.swift
//  swift-practice
//
//  Created by 유도혁 on 2022/06/04.
//

import SwiftUI

struct ContentView: View {
    //    Identifiable = 식별가능한 아이템?
    struct TodoList: Identifiable {
        let id = UUID()
        var title: String
        var content: String
        var isChecked: Bool
    }
    
    @State private var todoString = ""
    @State private var todoLists = [TodoList]()
    
    func addNewTodo() {
        let newTodo = TodoList(title: todoString, content: "", isChecked: false)
        todoLists.append(newTodo)
        todoString = ""
    }
    
    func toggleTodoChecked(_ idx: Int) {
        todoLists[idx].isChecked.toggle()
    }
    
    func removeTodo(_ idx: Int) {
        todoLists.remove(at: idx)
    }
    
    var body: some View {
        VStack {
            Text("스위프트를 갈아서 드셔보시겠습니까?")
                .font(.title.bold())
            
            HStack {
                Image(systemName: "square.and.pencil")
                TextField("your task", text: $todoString,  onCommit: {
                    addNewTodo()
                })
            }
            .textFieldStyle(DefaultTextFieldStyle())
            .frame(width: 300, height: 50, alignment: .center)
            
            List {
                ForEach(0..<todoLists.count, id: \.self) { idx in
                    HStack {
                        Button(action: {toggleTodoChecked(idx)}, label: {
                            Image(systemName: todoLists[idx].isChecked ? "checkmark.square" : "square")
                        })
                        Text(todoLists[idx].title)
                        Spacer()
                        Button(action: {removeTodo(idx)}, label: {
                            Image(systemName: "trash")
                        })
                    }.buttonStyle(BorderlessButtonStyle())
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 mini")
    }
}

