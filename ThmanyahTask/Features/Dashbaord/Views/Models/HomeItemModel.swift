//
//  CardModel.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 21/08/2025.
//

import Foundation

struct HomeSectionModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let contentType: SectionContentType
    let type: SectionType
    let cards: [HomeItemModel]
}

struct HomeItemModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let imageURL: String?
    var date: String?
    var duration: String?
    var subtitle: String?
}
