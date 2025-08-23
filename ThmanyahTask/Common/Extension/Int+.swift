//
//  Int+.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 21/08/2025.
//

import Foundation

public extension Int {
    var toDurationFormat: String {
        let hours = self / 3600
        let minutes = (self % 3600) / 60
        if hours > 0 {
            return "\(hours)h \(minutes)m"
        } else {
            return "\(minutes)m"
        }
    }
}
