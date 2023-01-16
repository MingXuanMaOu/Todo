//
//  ContentView.swift
//  Todo
//
//  Created by 刘铭 on 2023/1/17.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var showingAddTodoView = false
    var body: some View {
        NavigationView(content: {
            List(0 ..< 5){
                item in Text("ContenView")
            }
            .navigationBarTitle("待办事项",displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.showingAddTodoView.toggle()
            }, label:{
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showingAddTodoView, content: {
                AddTodoView().environment(\.managedObjectContext, self.managedObjectContext)
            })
            
        })
    }

 }




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
