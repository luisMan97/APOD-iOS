//
//  ApodListCoordinator.swift
//  APOD-iOS
//
//  Created by Jorge Luis Rivera Ladino on 29/06/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit
import SwiftUI

class ApodListCoordinator {
    
    func start(repository: ApodRepository = ApodRepository()) -> ApodListView {
        return showApodListView(repository: repository)
    }
    
    private func showApodListView(repository: ApodRepository) -> ApodListView {
        let viewModel = ApodListViewModel(repository: repository)
        return ApodListView(viewModel: viewModel)
    }
    
    func showApodRow(apod: Apod) -> ApodRow {
        let viewModel = ApodViewModel(apod: apod)
        return ApodRow(viewModel: viewModel)
    }
    
    func presentApodDetailView(with apod: Apod) -> ApodDetailView {
        return ApodDetailCoordinator().start(apod: apod)
    }
     
}
