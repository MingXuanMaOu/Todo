//
//  AddTodoView.swift
//  Todo
//
//  Created by 刘铭 on 2023/1/17.
//

import SwiftUI

struct AddTodoView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presenationMode
    
    @State private var name = ""
    @State private var priority = "标准"
    
    let priorities = ["高","标准","低"]
    
    var body: some View {
        NavigationView(content: {
            VStack{
                Form{
                    TextField("待办事项",text: $name)
                    
                    Picker("优先级",selection: $priority){
                        ForEach(priorities,id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Button(action: {
//                        print("保留一个新的待办事项")
                        if self.name != ""{
                            let todo = E_Todo(context: self.managedObjectContext)
                            todo.name = self.name
                            todo.priority = self.priority
                            
                            do{
                                try self.managedObjectContext.save()
                                print("新的待办事项：\(todo.name ?? ""),\(todo.priority ?? "")")
                            }catch{
                                print(error)
                            }
                        }
                        
                    }, label: {
                        Text("保存")
                    })
                }
                
                Spacer()
                
            }
            .navigationBarTitle("新的任务",displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.presenationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
            }))
        })
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
