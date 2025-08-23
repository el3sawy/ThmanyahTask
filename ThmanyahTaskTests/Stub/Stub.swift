//
//  SectionStub.swift
//  ThmanyahTaskTests
//
//  Created by Ahmed Naguib  on 22/08/2025.
//

import Foundation
@testable import ThmanyahTask

enum Stub {
    static func homeSectionResponse() -> HomeSectionResponse {
        let data = getJSON(bundle: Bundle.testBundle, for: "Sections")
        let response = parse(jsonData: data)
        return response
    }

    private static func parse(jsonData: Data) -> HomeSectionResponse {
        do {
            let decodedData = try JSONDecoder().decode(HomeSectionResponse.self, from: jsonData)
            return decodedData
        } catch {
            print("decode error")
        }
        return HomeSectionResponse(sections: [], pagination: nil)
    }

    static func sectionModels() -> [HomeSectionModel] {
        [
            .init(title: "Category A", contentType: .audioArticle, type: .bigSquare, cards: itemModels),
            .init(title: "Category B", contentType: .episode, type: .queue, cards: itemModels),
            .init(title: "Category C", contentType: .podcast, type: .square, cards: itemModels),
        ]
    }

    static var itemModels: [HomeItemModel] =
    [
        HomeItemModel(
            title: "PR Politics",
            imageURL: "https://media.npr.org/assets/img/2024/01/11/podcast-politics_2023_update1_sq-be7ef464dd058fe663d9e4cfe836fb9309ad0a4d.jpg?s=1400&c=66&f=jpg",
            date: "10-10-2020",
            duration: "10h 30m",
            subtitle: "10 round"
        ),

        HomeItemModel(
            title: "Live From Cleveland PR Politics Live From Cleveland  ",
            imageURL: "https://media.npr.org/assets/img/2024/01/11/podcast-politics_2023_update1_sq-be7ef464dd058fe663d9e4cfe836fb9309ad0a4d.jpg?s=1400&c=66&f=jpg",
            date: "10-10-2020",
            duration: "10h 30m"
        )
    ]
}
