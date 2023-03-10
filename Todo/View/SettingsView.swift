//
//  SettingsView.swift
//  Todo
//
//  Created by 刘铭 on 2023/1/18.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let themes: [Theme] = themeData
    @ObservedObject var theme = ThemeSettings()
    
    var body: some View {
        NavigationView(content: {
            VStack(alignment: .center,spacing: 0, content: {
                Form{

                    Section(header:
                                HStack{
                        Text("选择应用程序的配色主题")
                        
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 10,height: 10)
                            .foregroundColor(themes[self.theme.themeSettings].themeColor)
                    }
                                
                                , content: {
                        List(themes){
                            item in Button(action: {
                                self.theme.themeSettings = item.id
                            }, label: {
                                HStack{
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(item.themeColor)
                                    Text(item.themeName)
                                }
                            })
                            .accentColor(Color.primary)
                            
                            
                        }
                    })
                    .padding(.vertical,3)
                    
                    Section(header: Text("欢迎关注以下社交媒体"), content: {
                        FormRowLinkView(icon: "globe", color: .pink, text: "网址", link: "https://www.baidu.com")
                        FormRowLinkView(icon: "link", color: .blue, text: "微博", link: "https://www.baidu.com")
                        FormRowLinkView(icon: "play.rectangle", color: .green, text: "微信", link: "https://www.baidu.com")
                    })
                    .padding(.vertical,3)
                    
                    Section(header: Text("关于应用程序"), content:{
                        FormRowStaticView(icon: "gear", firstText: "应用程序", secondText: "待办事项")
                        FormRowStaticView(icon: "checkmark.seal", firstText: "兼容性", secondText: "iPhone, iPad")
                        FormRowStaticView(icon: "keyboard", firstText: "开发人员", secondText: "liuming/ Happy")
                        FormRowStaticView(icon: "paintbrush", firstText: "设计人员", secondText: "Oscar")
                        FormRowStaticView(icon: "flag", firstText: "版本", secondText: "1.0.0")
                    })
                    .padding(.vertical,3)
                  
                }
    
            })
            .navigationBarItems(trailing: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
            }))
            .navigationBarTitle("设置",displayMode: .inline)
            .background(Color("ColorBackground"))

        })
        .accentColor(themes[self.theme.themeSettings].themeColor)
        
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
