//
//  UI_123App.swift
//  UI-123
//
//  Created by にゃんにゃん丸 on 2021/02/11.
//

import SwiftUI

@main
struct UI_123App: App {
    @StateObject var model = CartViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
