//
//  ApodRepository.swift
//  APOD-iOS
//
//  Created by Jorge Luis Rivera Ladino on 29/06/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import Foundation
import Combine

class ApodRepository: ObservableObject {
    
    private var cancellable: AnyCancellable?
    
    // Private Output
    @Published private var apod: Apod?
    @Published private var endPetition = false {
        didSet {
            if endPetition {
                getApodList()
            }
        }
    }
    
    // Output Events
    @Published var showProgress = false
    @Published var apodList: [Apod] = []
    @Published var temporalApodList: [Apod] = []
    @Published var responseError: ResponseError?
    
    private var count = 1
    
    func getFirstApod() {
        showProgress = true
        
        let currentDate = DateHelper.getCurrendDateWith()
        getApod(date: currentDate)
    }
    
    private func getApodList() {
        if count < 8 {
            let currentDate = DateHelper.getCurrendDateWith()
            let modifiedDate = currentDate.toDate().dec(num: count)
            getApod(date: modifiedDate.toString(), isLast: count == 7 ? true : false)
            count += 1
        }
    }
    
    private func getApod(date: String, isLast: Bool = false) {
        responseError = nil
        
        let params = [
            "date": date
        ]
        
        cancellable = APIManager.request(service: .Apod(params))
            .sink(receiveCompletion: { [weak self] completion in
                if case let .failure(error) = completion {
                    self?.responseError = ResponseError(message: error.localizedDescription)
                }
                
                if isLast {
                    self?.apodList = self?.temporalApodList ?? []
                    self?.showProgress = false
                }
                
                self?.endPetition = true
            }, receiveValue: { [weak self] apod in
                self?.apod = self?.getApod(apod)
            })
    }
    
    func getApod(_ apod: Apod) -> Apod {
        temporalApodList.append(apod)
        return apod
    }
    
}
