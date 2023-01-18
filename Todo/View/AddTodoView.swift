//
//  AddTodoView.swift
//  Todo
//
//  Created by 刘铭 on 2023/1/17.
//

import SwiftUI

struct AddTodoView: View {
    @ObservedObject var theme = ThemeSettings()
    var themes:[Theme] = themeData
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presenationMode
    
    @State private var name = ""
    @State private var priority = "标准"
    
    @State private var errorShowing = false
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    
    let priorities = ["高","标准","低"]
    
    var body: some View {
        NavigationView(content: {
            VStack{
                VStack(alignment: .leading,spacing: 20){
                    TextField("待办事项",text: $name)
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(9)
                        .font(.system(size: 24,weight: .bold,design: .default))
                    
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
                        }else{
                            self.errorShowing = true
                            self.errorTitle = "无效的名称"
                            self.errorMessage = "请确保你输入的内容是\n待办事项必须的。"
                            return
                        }
                        self.presenationMode.wrappedValue.dismiss()
                        
                    }, label: {
                        Text("保存")
                            .font(.system(size: 24,weight: .bold,design: .default))
                            .padding()
                            .frame(minWidth: 0,maxWidth: .infinity)
                            .background(themes[self.theme.themeSettings].themeColor)
                            .cornerRadius(9)
                            .foregroundColor(.white)
                    })
                }
                
                Spacer()
                
            }
            .padding(.horizontal)
            .padding(.vertical,30)
            .navigationBarTitle("新的任务",displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.presenationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
            }))
            .alert(isPresented: $errorShowing, content: {
                Alert(title: Text(errorTitle),message: Text(errorMessage),dismissButton: .default(Text("确认")))
            })
            
        })
        .accentColor(themes[self.theme.themeSettings].themeColor)
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
