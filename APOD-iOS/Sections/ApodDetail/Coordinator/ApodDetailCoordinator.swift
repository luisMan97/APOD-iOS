//
//  ApodDetailCoordinator.swift
//  APOD-iOS
//
//  Created by Jorge Luis Rivera Ladino on 29/06/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import Foundation
import SwiftUI

class ApodDetailCoordinator {
    
    func start(apod: Apod) -> ApodDetailView {
        return showApodDetailView(apod: apod)
    }
    
    private func showApodDetailView(apod: Apod) -> ApodDetailView {
        let viewModel = ApodDetailViewModel(apod: apod)
        return ApodDetailView(viewModel: viewModel)
    }
    
}
