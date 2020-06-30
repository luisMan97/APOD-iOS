//
//  UINavigationBarExtensions.swift
//  APOD-iOS
//
//  Created by Jorge Luis Rivera Ladino on 29/06/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    func setup() {
        UINavigationBar.appearance().standardAppearance = UINavigationBarAppearance().setup()
        UINavigationBar.appearance().compactAppearance = UINavigationBarAppearance().setup()
        UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBarAppearance().setup()
    }
    
}

