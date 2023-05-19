//
//  Fonts.swift
//  
//
//  Created by 금가경 on 2023/04/16.
//
import SwiftUI

extension Font {
    static func registerFonts() {
        self.register(name: "IrishGrover-Regular", withExtension: "ttf")
    }

    static func register(name: String, withExtension: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: withExtension),CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
        else { return print("failed to regist \(name) font") }
    }
}

