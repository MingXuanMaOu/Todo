//
//  EmptyListView.swift
//  Todo
//
//  Created by 刘铭 on 2023/1/18.
//

import SwiftUI

struct EmptyListView: View {
    
    @State private var isAnimated = false
    
    let images: [String] = [
        "illustration-1",
        "illustration-2",
        "illustration-3",
        "illustration-4",
        "illustration-5",
    ]
    
    let tips: [String] = [
        "更好的利用你的时间",
        "放慢你的工作节奏，效果更佳",
        "始终保持你的甜美和简捷",
        "努力工作是第一要务",
        "吾日三省吾身"
    ]
    
    var body: some View {
        
        ZStack{
            VStack(alignment: .center,spacing: 20, content: {
                Image("\(images.randomElement() ?? images[0])")
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 256,idealWidth: 280,maxWidth: 360,minHeight: 256,idealHeight: 280,maxHeight: 360,alignment: .center)
                    .layoutPriority(1)
                
                Text("\(tips.randomElement() ?? tips[0])")
                    .layoutPriority(0.5)
                    .font(.headline)
            })
            .padding(.horizontal)
            .opacity(isAnimated ? 1: 0)
            .offset(y: isAnimated ? 0: -50)
            .animation(Animation.easeIn(duration: 1.5), value: isAnimated)
            .onAppear(){
                self.isAnimated.toggle()
            }
        }
        .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
        .background(Color("ColorBase"))
        .edgesIgnoringSafeArea(.all)
        
        
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}
