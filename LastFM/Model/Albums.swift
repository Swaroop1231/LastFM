//
//  Albums.swift
//  LastFM
//
//  Created by Prathap on 27/07/20.
//  Copyright © 2020 Satya Swaroop. All rights reserved.
//
//   let albums = try? newJSONDecoder().decode(Albums.self, from: jsonData)

import Foundation

// MARK: - Albums
struct Albums: Codable {
    var results: Results?
}

// MARK: - Results
struct Results: Codable {
    var opensearchQuery: OpensearchQuery?
    var opensearchTotalResults, opensearchStartIndex, opensearchItemsPerPage: String?
    var albummatches: Albummatches?
    var attr: Attr?

    enum CodingKeys: String, CodingKey {
        case opensearchQuery = "opensearch:Query"
        case opensearchTotalResults = "opensearch:totalResults"
        case opensearchStartIndex = "opensearch:startIndex"
        case opensearchItemsPerPage = "opensearch:itemsPerPage"
        case albummatches
        case attr = "@attr"
    }
}

// MARK: - Albummatches
struct Albummatches: Codable {
    var album: [Album]?
}

// MARK: - Album
struct Album: Codable {
    var name, artist: String?
    var url: String?
    var image: [Image]?
    var streamable, mbid: String?
}

// MARK: - Image
struct Image: Codable {
    var text: String?
    var size: Size?

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case size
    }
}

enum Size: String, Codable {
    case extralarge = "extralarge"
    case large = "large"
    case medium = "medium"
    case small = "small"
}

// MARK: - Attr
struct Attr: Codable {
    var attrFor: String?

    enum CodingKeys: String, CodingKey {
        case attrFor = "for"
    }
}

// MARK: - OpensearchQuery
struct OpensearchQuery: Codable {
    var text, role, searchTerms, startPage: String?

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case role, searchTerms, startPage
    }
}

