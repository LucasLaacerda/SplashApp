//
//  LaucnhScreenPhase.swift
//  SplashApp
//
//  Created by Lucas Lacerda on 27/11/22.
//

import Foundation

enum LaucnhScreenPhase {
    case first
    case second
    case completed
}

final class LaunchScreenManager: ObservableObject {
    
    @Published private(set) var state: LaucnhScreenPhase = .first
    
    func dimiss(){
        self.state = .second
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.state = .completed
        }
    }
}
