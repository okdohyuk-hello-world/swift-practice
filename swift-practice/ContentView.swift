//
//  ContentView.swift
//  swift-practice
//
//  Created by 유도혁 on 2022/06/04.
//

import SwiftUI

struct ContentView: View {
    @State private var toDoString = ""
    
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

