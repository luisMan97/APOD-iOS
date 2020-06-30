//
//  ApodListViewModel.swift
//  APOD-iOS
//
//  Created by Jorge Luis Rivera Ladino on 29/06/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import Foundation
import Combine

class ApodListViewModel: ObservableObject {
    
    private var cancellables: Set<AnyCancellable> = []
    private var cancellable: AnyCancellable?
    private var repository: ApodRepository
    
    // Output Events
    @Published var showProgress = false
    @Published var apodList: [Apod] = []
    @Published var apods: [ApodModel] = []
    @Published var responseError: ResponseError?
    
    init(repository: ApodRepository) {
        self.repository = repository
        showProgress = repository.showProgress
        responseError = repository.responseError
        apodList = repository.apodList
        publishedAssign()
    }
    
    func publishedAssign() {
        repository.$apodList
            .map { apod in
                apod.map {
                    ApodModel(explanation: $0.explanation ?? "Null explanation", title: $0.title ?? "Null title")
                }
            }
            .assign(to: \.apods, on: self)
            .store(in: &cancellables)
    }
}
