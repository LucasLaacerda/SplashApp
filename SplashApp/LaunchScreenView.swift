//
//  LaunchScreenView.swift
//  SplashApp
//
//  Created by Lucas Lacerda on 27/11/22.
//

import SwiftUI

struct LaunchScreenView: View {
    
    @EnvironmentObject var launchScreenManager: LaunchScreenManager

    @State private var firstPhaseIsAnimating: Bool = false
    @State private var secondPhaseIsAnimating: Bool = false
    private let timer = Timer.publish(every: 0.65, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            background
            logo
        }
        .onReceive(timer) {
            input in
                
            switch launchScreenManager.state {
            case .first:
                withAnimation(.spring()){
                    firstPhaseIsAnimating.toggle()
                }
            case .second:
                withAnimation(.spring()){
                    secondPhaseIsAnimating.toggle()
                }
            default: break
            }
            
            
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView().environmentObject(LaunchScreenManager())
    }
}

private extension LaunchScreenView {
    var background: some View {
        Color("launch-color-background").edgesIgnoringSafeArea(.all)
    }
    
    var logo: some View {
        Image("logo")
            .scaleEffect(firstPhaseIsAnimating ? 0.6 : 1)
            .scaleEffect(secondPhaseIsAnimating ? UIScreen.main.bounds.size.height/4 : 1)
    }
}
