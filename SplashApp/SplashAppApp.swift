//
//  SplashAppApp.swift
//  SplashApp
//
//  Created by Lucas Lacerda on 27/11/22.
//

import SwiftUI

@main
struct SplashAppApp: App {
    
    @StateObject var launchScreenManager = LaunchScreenManager()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                if launchScreenManager.state != .completed {
                    LaunchScreenView()
                }
            }
            .environmentObject(launchScreenManager)
        }
    }
}
