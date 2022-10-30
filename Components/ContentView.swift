//
//  ContentView.swift
//  swift-practice
//
//  Created by 유도혁 on 2022/06/04.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var todoLists : TodoLists
        
        var body: some View {
            VStack {
                HeaderView()
                TextFieldView()
                TodoListView()
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(TodoLists())
    }
}
