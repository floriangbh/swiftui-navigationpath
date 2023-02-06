//
//  NavigationPathSwiftUIApp.swift
//  NavigationPathSwiftUI
//
//  Created by Florian GABACH on 03/02/2023.
//

import SwiftUI

@main
struct NavigationPathSwiftUIApp: App {
    @StateObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
        }
    }
}
