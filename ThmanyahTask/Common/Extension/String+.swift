//
//  String+.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 22/08/2025.
//

import Foundation

extension String {
    var toDate: String? {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

        var date: Date?
        if let parsedDate = isoFormatter.date(from: self) {
            date = parsedDate
        } else {
            isoFormatter.formatOptions = [.withInternetDateTime]
            date = isoFormatter.date(from: self)
        }

        guard let date = date else { return nil }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: date)
    }

    var trimmed: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
