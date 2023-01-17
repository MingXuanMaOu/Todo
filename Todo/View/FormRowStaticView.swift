//
//  FormRowStaticView.swift
//  Todo
//
//  Created by 刘铭 on 2023/1/18.
//

import SwiftUI

struct FormRowStaticView: View {
    
    var icon: String
    var firstText: String
    var secondText: String
    
    var body: some View {
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 8,style: .continuous)
                    .fill(Color.gray)
                Image(systemName: icon)
                    .foregroundColor(.white)
            }
            .frame(width: 36,height: 36,alignment: .center)
            
            Text(firstText).foregroundColor(.gray)
            Spacer()
            Text(secondText)
        }
    }
}

struct FormRowStaticView_Previews: PreviewProvider {
    static var previews: some View {
        FormRowStaticView(icon: "gear", firstText: "应用程序", secondText: "待办事项")
    }
}
