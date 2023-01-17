//
//  FormRowLinkView.swift
//  Todo
//
//  Created by 刘铭 on 2023/1/18.
//

import SwiftUI

struct FormRowLinkView: View {
    var icon: String
    var color: Color
    var text: String
    var link: String
    
    var body: some View {
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 8,style: .continuous)
                    .fill(color)
                Image(systemName: icon)
                    .imageScale(.large)
                    .foregroundColor(.white)
            }
            .frame(width: 36,height: 36,alignment: .center)
            
            Text(text).foregroundColor(.gray)
            Spacer()
            Button(action: {
                guard let url = URL(string: self.link),UIApplication.shared.canOpenURL(url) else{
                    return
                }
                UIApplication.shared.open(url as URL)
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 14,weight: .semibold,design: .rounded))
            })
        }
    }
}

struct FormRowLinkView_Previews: PreviewProvider {
    static var previews: some View {
        FormRowLinkView(icon: "globe", color: Color.pink, text: "网址", link: "www.baidu.com")
          .previewLayout(.fixed(width: 375, height: 60))
          .padding()
    }
}
