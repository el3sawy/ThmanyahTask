//
//  SectionType.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib  on 23/08/2025.
//

enum SectionType {
    case square
    case twoLinesGrid
    case bigSquare
    case queue

    init?(key: String) {
        switch key.lowercased() {
        case "square":
            self = .square
        case "2_lines_grid":
            self = .twoLinesGrid
        case "big_square", "big square":
            self = .bigSquare
        case "queue":
            self = .queue
        default:
            self = .queue
        }
    }
}

enum SectionContentType: String {
    case podcast = "podcast"
    case episode = "episode"
    case audioBook = "audio_book"
    case audioArticle = "audio_article"
}
