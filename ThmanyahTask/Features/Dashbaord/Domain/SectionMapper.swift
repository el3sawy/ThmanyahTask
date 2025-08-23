//
//  SectionMapper.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 22/08/2025.
//

import Foundation

protocol SectionMapper {
    func map(_ section: HomeSectionResponse.Section) -> HomeSectionModel
}
extension SectionMapper {
    func map(_ section: HomeSectionResponse.Section) -> HomeSectionModel {
        let contents: [HomeItemModel] = section.content?.compactMap(mapContent) ?? []
        return HomeSectionModel(
            title: section.name ?? "",
            contentType: SectionContentType(rawValue: section.contentType ?? "") ?? .podcast,
            type: SectionType(key: section.type ?? "") ?? .queue,
            cards: contents
        )
    }
    
    func mapContent(content: HomeSectionResponse.Content) -> HomeItemModel {
        HomeItemModel(
            title: content.name ?? "",
            imageURL: content.avatarURL ?? "",
            date: content.releaseDate?.toDate,
            duration: content.duration?.intValue?.toDurationFormat,
            subtitle: content.description
        )
    }
}
