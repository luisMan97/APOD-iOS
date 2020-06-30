//
//  ApodViewModel.swift
//  APOD-iOS
//
//  Created by Jorge Luis Rivera Ladino on 29/06/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import Foundation

class ApodViewModel: ObservableObject {
    
    private var apod: Apod?
    
    var title: String {
        apod?.title ?? "Null title"
    }
    
    var date: String {
        apod?.date ?? "Null date"
    }
    
    init(apod: Apod?) {
        self.apod = apod
    }
    
}
