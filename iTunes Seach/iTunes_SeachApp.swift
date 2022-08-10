//
//  iTunes_SeachApp.swift
//  iTunes Seach
//
//  Created by Mark Perryman on 8/10/22.
//

import SwiftUI

@main
struct iTunes_SeachApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    // This suppresses constraint warnings
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
