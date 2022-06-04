//
//  ContentView.swift
//  swift-practice
//
//  Created by 유도혁 on 2022/06/04.
//

import SwiftUI

struct ContentView: View {
    @State private var toDoString = ""
    
    //    Identifiable = 식별가능한 아이템?
    struct TodoList: Identifiable {
        let id = UUID()
        var title: String
        var content: String
    }
    
    private var todoLists = [
        TodoList(title: "스위프트를 배워봅시다", content: "리스트 내용"),
        TodoList(title: "노래 듣기", content: "리스트 내용"),
        TodoList(title: "다음엔 코틀린으로", content: "리스트 내용"),
    ]
    
    var body: some View {
        VStack {
            Text("스위프트를 갈아서 드셔보시겠습니까?")
                .font(.title.bold())
            
            HStack {
                Image(systemName: "square.and.pencil")
                TextField("your task", text: $toDoString)
            }
            .textFieldStyle(DefaultTextFieldStyle())
            .frame(width: 300, height: 50, alignment: .center)
            
            List {
                ForEach(0..<todoLists.count, id: \.self) { i in
                    HStack {
                        Button(action: {}, label: {
                            Image(systemName: "square")
                        })
                        Text(todoLists[i].title)
                        Spacer()
                        Button(action: {}, label: {
                            Image(systemName: "trash")
                        })
                    }
                    
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

