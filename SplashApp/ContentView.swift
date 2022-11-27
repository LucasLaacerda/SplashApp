//
//  ContentView.swift
//  SplashApp
//
//  Created by Lucas Lacerda on 27/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    
    var body: some View {
        Text("Splash Twitter!")
            .onAppear{
                DispatchQueue
                    .main
                    .asyncAfter(deadline: .now() + 5) {
                        launchScreenManager.dimiss()
                    }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LaunchScreenManager())
    }
}
