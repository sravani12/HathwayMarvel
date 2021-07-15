//
//  Date+Extension.swift
//  HathwayAssignment
//
//  Created by Vidya Sravani on 7/15/21.
//

import Foundation

extension Date {
    var timestamp: String {
        return String(Int(timeIntervalSince1970) * 1000)
    }
}

