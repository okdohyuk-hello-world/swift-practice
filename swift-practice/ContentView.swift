//
//  ContentView.swift
//  swift-practice
//
//  Created by 유도혁 on 2022/06/04.
//

import SwiftUI

struct ContentView: View {
    //    Identifiable = 식별가능한 아이템?
    struct TodoList: Identifiable, Codable {
        let id = UUID()
        var title: String
        var content: String
        var isChecked: Bool
    }
    
    @State private var todoString = ""
    @State private var todoLists = [TodoList]() {
        didSet {
            saveTodoList()
        }
    }
    
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
    
    func generateToJSON() -> String? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        do {
            let data = try encoder.encode(todoLists)
            return String(data: data, encoding: .utf8)
        }
        catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    func generateToData(_ jsonString: String) -> [TodoList]? {
        let decoder = JSONDecoder()
        let jsonData = jsonString.data(using: .utf8)
        
        if jsonData == nil {
            print("Error: Cannot convert json String to Data")
            return nil
        }
        
        do {
            return try decoder.decode([TodoList].self, from: jsonData!)
        }
        catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    func getDocumentPath() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    func saveTodoList() {
        let path = getDocumentPath().appendingPathComponent("todolist.json")
        let jsonString = generateToJSON()
        
        if jsonString == nil {
            print("Error: No JSON String found")
            return
        }
        
        print(path.absoluteString)
        
        do {
            try jsonString?.write(to: path, atomically: true, encoding: .utf8)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func loadTodoList() {
        let path = getDocumentPath().appendingPathComponent("todolist.json")
        
        do {
            let jsonString = try String(contentsOf: path)
            let jsonData = generateToData(jsonString)
            
            if jsonData == nil {
                print("Error: No JSON Data found")
                return
            }
            
            todoLists = jsonData!
        }
        catch {
            print(error.localizedDescription)
        }
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
        .task {
            loadTodoList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

