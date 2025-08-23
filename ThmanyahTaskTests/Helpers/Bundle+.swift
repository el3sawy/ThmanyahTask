//
//  Bundle+.swift
//  ThmanyahTaskTests
//
//  Created by Ahmed Naguib  on 22/08/2025.
//

import Foundation

extension Bundle {
    public class var testBundle: Bundle {
        return Bundle(for: TestBundleToken.self)
    }
}

private final class TestBundleToken {}

// MARK: - helpers
func getJSON(bundle: Bundle, for jsonName: String) -> Data {
    guard let path = bundle.path(forResource: jsonName, ofType: "json") else {
        fatalError("Could not retrieve file \(jsonName).json")
    }
    let url = URL(fileURLWithPath: path)
    let data = try! Data(contentsOf: url)
    return data
}
