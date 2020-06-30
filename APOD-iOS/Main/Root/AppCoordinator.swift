//
//  AppCoordinator.swift
//  APOD-iOS
//
//  Created by Jorge Luis Rivera Ladino on 29/06/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import SwiftUI

class AppCoordinator {
    
    private(set) var window: UIWindow?
    var scene: UIScene
    
    init(scene: UIScene) {
        self.scene = scene
    }
    
    func start() {
        let repository = ApodRepository()
        repository.getFirstApod()
        
        // Create the SwiftUI view that provides the window contents.
        let contentView = RootView().environmentObject(repository)
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
