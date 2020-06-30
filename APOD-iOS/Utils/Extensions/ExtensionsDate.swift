//
//  ExtensionsDate.swift
//  APOD-iOS
//
//  Created by Jorge Luis Rivera Ladino on 29/06/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import Foundation

extension Date {
    
    func toString(formatter: String = "yyyy-MM-dd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        return dateFormatter.string(from: self)
    }
    
    func inc(num: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: num, to: self) ?? Date()
    }
    
    func dec(num: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: -num, to: self) ?? Date()
    }
    
}
