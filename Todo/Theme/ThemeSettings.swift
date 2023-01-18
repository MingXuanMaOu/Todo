//
//  ThemeSettings.swift
//  Todo
//
//  Created by 刘铭 on 2023/1/18.
//

import SwiftUI

class ThemeSettings: ObservableObject{
    @Published var themeSettings: Int =
    UserDefaults.standard.integer(forKey: "Theme"){
        didSet{
            UserDefaults.standard.set(self.themeSettings,forKey: "Theme")
        }
    }
    public static let shared = ThemeSettings()
}
