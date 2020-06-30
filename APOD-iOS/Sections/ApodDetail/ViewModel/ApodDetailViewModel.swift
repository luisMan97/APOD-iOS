//
//  ApodDetailViewModel.swift
//  APOD-iOS
//
//  Created by Jorge Luis Rivera Ladino on 29/06/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import Foundation

class ApodDetailViewModel: ObservableObject {
    
    private var apod: Apod?
    
    var title: String {
        apod?.title ?? "Null title"
    }
    
    var explanation: String {
        apod?.explanation ?? "Null explanation"
    }
    
    var date: String {
        apod?.date ?? "Null date"
    }
    
    var imageURL: URL? {
        URL(string: imageString)
    }
    
    private var imageString: String {
        apod?.hdurl ?? apod?.url ?? "Null image"
    }
    
    init(apod: Apod?) {
        self.apod = apod
    }
    
}
