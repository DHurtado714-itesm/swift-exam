//
//  Movie.swift
//  swfit-examen
//
//  Created by Daniel Hurtado on 10/10/23.
//

import Foundation

import Foundation

struct Movie: Decodable, Identifiable {
    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
}


struct MovieResponse: Decodable {
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int
}


//struct MovieResponse: Codable {
//    let page: Int
//    let results: [Movie]
//    let totalPages: Int
//    let totalResults: Int
//
//    enum CodingKeys: String, CodingKey {
//        case page
//        case results
//        case totalPages = "total_pages"
//        case totalResults = "total_results"
//    }
//}
//
//struct Movie: Codable {
//    let title: String
//    let overview: String
//    let releaseDate: String
//    let posterPath: String?
//    let voteAverage: Double
//    let voteCount: Int
//
//    enum CodingKeys: String, CodingKey {
//        case title = "original_title"
//        case overview
//        case releaseDate = "release_date"
//        case posterPath = "poster_path"
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
//    }
//}
