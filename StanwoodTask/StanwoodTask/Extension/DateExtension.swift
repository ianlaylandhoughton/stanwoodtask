//
//  DateExtension.swift
//  GithubTrendingRepositories
//
//  Created by Ian Houghton on 28/06/2018.
//  Copyright © 2018 YakApps. All rights reserved.
//

import Foundation

extension Date {
    
    static private func dateFormatter(format: String) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter
    }
    
    static func yesterdayDateString() -> String? {
        guard let yesterdaysDate = Calendar.current.date(byAdding: .day, value: -1, to: Date()) else {
            return nil
        }
        
        return self.dateFormatter(format: StandardDateFormat).string(from: yesterdaysDate)
    }
    
    static func lastWeekDateString() -> String? {
        guard let yesterdaysDate = Calendar.current.date(byAdding: .day, value: -7, to: Date()) else {
            return nil
        }
        
        return self.dateFormatter(format:StandardDateFormat).string(from: yesterdaysDate)
    }
    
    static func lastMonthDateString() -> String? {
        guard let yesterdaysDate = Calendar.current.date(byAdding: .day, value: -30, to: Date()) else {
            return nil
        }
        
        return self.dateFormatter(format: StandardDateFormat).string(from: yesterdaysDate)
    }
}
