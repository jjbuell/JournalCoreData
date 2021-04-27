//
//  DateFormatter+Extras.swift
//  JournalCoreData
//
//  Created by JJB on 4/26/21.
//

import Foundation

extension DateFormatter {
    static let entryDate: DateFormatter = {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        return dateFormatter
    }()
    
    static let entryTime: DateFormatter = {
        
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .short
        
        return timeFormatter
    }()
} //End of extension
