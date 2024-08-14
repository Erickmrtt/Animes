//
//  TrendingAnimesModel.swift
//  Anime
//
//  Created by erick on 12/08/24.
//
import Foundation

// MARK: - TrendingAnimesModel
struct TrendingAnimesModel: Codable {
    let data: [TrendingAnimesDetailsModel]?

    enum CodingKeys: String, CodingKey {
        case data
    }
}

// MARK: - Datum
struct TrendingAnimesDetailsModel: Codable {
    let id: String?
    let type: String?
    let links: DatumLinks?
    let attributes: Attributes?
    let relationships: [String: Relationship]?

    enum CodingKeys: String, CodingKey {
        case id
        case type
        case links
        case attributes
        case relationships
    }
}

// MARK: - Attributes
struct Attributes: Codable {
    let createdAt: String?
    let updatedAt: String?
    let slug: String?
    let synopsis: String?
    let coverImageTopOffset: Int?
    let titles: Titles?
    let canonicalTitle: String?
    let abbreviatedTitles: [String]?
    let averageRating: String?
    let ratingFrequencies: [String: String]?
    let userCount: Int?
    let favoritesCount: Int?
    let startDate: String?
    let endDate: String?
    let popularityRank: Int?
    let ratingRank: Int?
    let ageRating: String?
    let ageRatingGuide: String?
    let subtype: String?
    let status: String?
    let tba: String?
    let posterImage: PosterImage?
    let coverImage: CoverImage?
    let episodeCount: Int?
    let episodeLength: Int?
    let youtubeVideoId: String?
    let showType: String?
    let nsfw: Bool?

    enum CodingKeys: String, CodingKey {
        case createdAt
        case updatedAt
        case slug
        case synopsis
        case coverImageTopOffset
        case titles
        case canonicalTitle
        case abbreviatedTitles
        case averageRating
        case ratingFrequencies
        case userCount
        case favoritesCount
        case startDate
        case endDate
        case popularityRank
        case ratingRank
        case ageRating
        case ageRatingGuide
        case subtype
        case status
        case tba
        case posterImage
        case coverImage
        case episodeCount
        case episodeLength
        case youtubeVideoId
        case showType
        case nsfw
    }
}

// MARK: - CoverImage
struct CoverImage: Codable {
    let tiny: String?
    let small: String?
    let large: String?
    let original: String?
    let meta: Meta?

    enum CodingKeys: String, CodingKey {
        case tiny
        case small
        case large
        case original
        case meta
    }
}

// MARK: - Meta
struct Meta: Codable {
    let dimensions: Dimensions?

    enum CodingKeys: String, CodingKey {
        case dimensions
    }
}

// MARK: - Dimensions
struct Dimensions: Codable {
    let tiny: Large?
    let small: Large?
    let large: Large?
    let medium: Large?

    enum CodingKeys: String, CodingKey {
        case tiny
        case small
        case large
        case medium
    }
}

// MARK: - Large
struct Large: Codable {
    let width: JSONNull?
    let height: JSONNull?

    enum CodingKeys: String, CodingKey {
        case width
        case height
    }
}

// MARK: - PosterImage
struct PosterImage: Codable {
    let tiny: String?
    let small: String?
    let medium: String?
    let large: String?
    let original: String?
    let meta: Meta?

    enum CodingKeys: String, CodingKey {
        case tiny
        case small
        case medium
        case large
        case original
        case meta
    }
}

// MARK: - Titles
struct Titles: Codable {
    let en: String?
    let enJp: String?
    let jaJp: String?

    enum CodingKeys: String, CodingKey {
        case en
        case enJp
        case jaJp
    }
}

// MARK: - DatumLinks
struct DatumLinks: Codable {
    let linksSelf: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf
    }
}

// MARK: - Relationship
struct Relationship: Codable {
    let links: RelationshipLinks?

    enum CodingKeys: String, CodingKey {
        case links
    }
}

// MARK: - RelationshipLinks
struct RelationshipLinks: Codable {
    let linksSelf: String?
    let related: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf
        case related
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
    }

    public var hashValue: Int {
            return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
    }

    public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
    }
}

