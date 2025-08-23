//
//  StringOrInt.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 22/08/2025.
//

enum StringOrInt: Codable {
    case int(Int)
    case string(String)

    var stringValue: String {
        switch self {
        case .int(let value): return String(value)
        case .string(let value): return value
        }
    }

    var intValue: Int? {
        switch self {
        case .int(let value): return value
        case .string(let value): return Int(value)
        }
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let intValue = try? container.decode(Int.self) {
            self = .int(intValue)
        } else if let stringValue = try? container.decode(String.self) {
            self = .string(stringValue)
        } else {
            throw DecodingError.typeMismatch(
                StringOrInt.self,
                DecodingError.Context(codingPath: decoder.codingPath,
                                      debugDescription: "Expected Int or String")
            )
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .int(let value): try container.encode(value)
        case .string(let value): try container.encode(value)
        }
    }
}
