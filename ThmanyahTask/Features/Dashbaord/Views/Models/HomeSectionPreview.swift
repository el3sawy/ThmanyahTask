//
//  HomeSectionPreview.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib  on 23/08/2025.
//

import Foundation

#if DEBUG
extension HomeSectionModel {
    static var mock: HomeSectionModel {
        .init(title: "New Podcasts", contentType: .audioArticle, type: .bigSquare, cards: HomeItemModel.mock)
    }
    static var mocks: [HomeSectionModel] {
       [
        .init(title: "New Podcasts", contentType: .audioArticle, type: .bigSquare, cards: HomeItemModel.mock),
        .init(title: "New Podcasts", contentType: .audioArticle, type: .bigSquare, cards: HomeItemModel.mock),
        .init(title: "New Podcasts", contentType: .audioArticle, type: .bigSquare, cards: HomeItemModel.mock)
        ]
    }
}

extension HomeItemModel {
    static var mock: [HomeItemModel] = [

        HomeItemModel(
            title: "PR Politics ",
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
#endif
