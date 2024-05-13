//
//  EQuranApp.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 03/05/24.
//

import SwiftUI

@main
struct EQuranApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MenuBarView()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
