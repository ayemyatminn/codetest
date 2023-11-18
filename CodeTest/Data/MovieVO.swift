//
//  MovieVO.swift
//  CodeTest
//
//  Created by Aye Myat Minn on 18/11/2023.
//

import Foundation

struct MovieVO: Codable {
    let id: Int
    let overview: String
    let title: String
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case overview = "overview"
        case title = "title"
        case releaseDate = "release_date"
    }
}

struct MovieResponse: Codable {
    let results: [MovieVO]
    let totalPages: Int
    let totalResults: Int
    let page: Int
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case page = "page"
    }
}
