//
//  Items.swift
//  DubizzlesClassifieds
//
//  Created Shahzaib Iqbal Bhatti onon 8/3/2021.
//

import Foundation

struct Product: Codable {
    
    var createdAt: String?
    var imageIds: [String]?
    var imageUrls: [String]?
    var imageUrlsThumbnails: [String]?
    var name: String?
    var price: String?
    var uid: String?
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case imageIds = "image_ids"
        case imageUrls = "image_urls"
        case imageUrlsThumbnails = "image_urls_thumbnails"
        case name = "name"
        case price = "price"
        case uid = "uid"
    }
    
    init(from decoder: Decoder) throws {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
            imageIds = try values.decodeIfPresent([String].self, forKey: .imageIds)
            imageUrls = try values.decodeIfPresent([String].self, forKey: .imageUrls)
            imageUrlsThumbnails = try values.decodeIfPresent([String].self, forKey: .imageUrlsThumbnails)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            price = try values.decodeIfPresent(String.self, forKey: .price)
            uid = try values.decodeIfPresent(String.self, forKey: .uid)
        } catch let DecodingError.typeMismatch(type, context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print(error)
            print(error.localizedDescription)
        }
    }
}
