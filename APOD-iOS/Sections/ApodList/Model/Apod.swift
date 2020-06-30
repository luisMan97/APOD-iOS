//
//  Apod.swift
//  APOD-iOS
//
//  Created by Jorge Luis Rivera Ladino on 29/06/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import Foundation

class Apod: Codable, Identifiable {
    let copyright: String?
    let date: String?
    let explanation: String?
    let hdurl: String?
    let media_type: String?
    let service_version: String?
    let title: String?
    let url: String?
}


struct ApodModel: Identifiable {
    var id = UUID()
    var explanation: String
    var title: String
}
