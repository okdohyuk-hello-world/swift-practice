//
//  Header.swift
//  swift-practice
//
//  Created by 유도혁 on 2022/06/04.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        Text("스위프트를 갈아서 드셔보시겠습니까?")
            .font(.title.bold())
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
