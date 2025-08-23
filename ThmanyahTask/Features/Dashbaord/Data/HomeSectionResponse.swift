//
//  DashboardResponse.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 21/08/2025.
//

import Foundation

struct HomeSectionResponse: Codable {
    let sections: [Section]?
    let pagination: Pagination?
    
    struct Section: Codable {
        let name, type, contentType: String?
        let order: StringOrInt?
        let content: [Content]?
        
        enum CodingKeys: String, CodingKey {
            case name, type
            case contentType = "content_type"
            case order, content
        }
    }
    
    struct Pagination: Codable {
        let nextPage: String?
        let totalPages: Int?
        
        enum CodingKeys: String, CodingKey {
            case nextPage = "next_page"
            case totalPages = "total_pages"
        }
    }
    struct Content: Codable {
        let podcastID: String?
        let name, description: String?
        let avatarURL: String?
        let duration: StringOrInt?
        let language: String?
        let priority, popularityScore: StringOrInt?
       
        let podcastPopularityScore, podcastPriority: StringOrInt?
        let episodeID: String?
        let episodeType: String?
        let podcastName: String?
        let authorName: String?
        let separatedAudioURL, audioURL: String?
        let releaseDate: String?
        let paidIsEarlyAccess, paidIsNowEarlyAccess, paidIsExclusive: Bool?
        let paidIsExclusivePartially: Bool?
        let paidExclusiveStartTime: StringOrInt?
        let audiobookID: String?
        let articleID: String?
        
        enum CodingKeys: String, CodingKey {
            case podcastID = "podcast_id"
            case name, description
            case avatarURL = "avatar_url"
//            case episodeCount = "episode_count"
            case duration, language, priority, popularityScore, podcastPopularityScore, podcastPriority
            case episodeID = "episode_id"
            case episodeType = "episode_type"
            case podcastName = "podcast_name"
            case authorName = "author_name"
            case separatedAudioURL = "separated_audio_url"
            case audioURL = "audio_url"
            case releaseDate = "release_date"
            case paidIsEarlyAccess = "paid_is_early_access"
            case paidIsNowEarlyAccess = "paid_is_now_early_access"
            case paidIsExclusive = "paid_is_exclusive"
            case paidIsExclusivePartially = "paid_is_exclusive_partially"
            case paidExclusiveStartTime = "paid_exclusive_start_time"
            case audiobookID = "audiobook_id"
            case articleID = "article_id"
        }
    }
}
