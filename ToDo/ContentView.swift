//
//  ContentView.swift
//  ToDo
//
//  Created by 김동운 on 2024/06/29.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // 생성, 삭제
    @Environment(\.modelContext) private var modelContext
    
    // 조회, 업데이트
    @Query var todoList: [Todo] = [
        Todo(title: "친구 만나기"),
        Todo(title: "과제 제출하기"),
        Todo(title: "푹쉬기")
    ]
    
    func addTodo() {
        withAnimation {
            let newTodo = Todo(title: "새로운 투두")
//            todoList.append(newTodo)
            modelContext.insert(newTodo)
        }
    }
    
    func deleteTodo(indexSet: IndexSet) {
        withAnimation {
            for index in indexSet {
//                todoList.remove(at: index)
                let todo = todoList[index]
                modelContext.delete(todo)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(todoList) { todo in
                    HStack {
                        Image(systemName: todo.isComplicated ?
                              "circle.fill" : "circle")
                        .foregroundStyle(Color.pink)
                        .onTapGesture {
                            todo.isComplicated.toggle()
                        }
                        
                        NavigationLink {
                            TodoDetailView(todo: todo)
                        } label: {
                            Text(todo.title)
                                .strikethrough(todo.isComplicated, color: Color.gray)
                                .foregroundStyle(todo.isComplicated ?
                                                 Color.gray : Color.primary)
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .onDelete(perform: deleteTodo)
            }
            .listStyle(.plain)
            .navigationTitle("ToDo 🏓")
            .toolbar {
                ToolbarItem {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addTodo, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
