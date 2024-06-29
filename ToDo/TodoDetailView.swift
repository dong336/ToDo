//
//  TodoDetailView.swift
//  ToDo
//
//  Created by 김동운 on 6/29/24.
//

import SwiftUI

struct TodoDetailView: View {
    @State var todo: Todo
    
    var body: some View {
        VStack {
            TextField("투두 타이틀", text: $todo.title)
                .font(.title2)
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 2)
                )
            TextEditor(text: $todo.detail)
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 2)
                )
        }
        .padding()
        .navigationTitle("Edit Task 📝")
    }
}

#Preview {
    TodoDetailView(todo: Todo(title: "2번째 화면의 투두"))
}
