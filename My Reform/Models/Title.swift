//
//  Title.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/15.
//

import Foundation

struct TitleResponse: Codable {
    let results: [Title]
}

// API 명세서 보고 받아올 값들
struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}
