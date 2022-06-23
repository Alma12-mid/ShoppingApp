//
//  Model.swift
//  Shopping
//
//  Created by Alma Midhun on 17/06/22.
//

import Foundation

struct Shopping: Codable {
    let status: Bool?
    var homeData: [ShoppingData]
    func getShoppingData() -> [ShoppingData] {
        homeData.map { value in
            return value
        }
    }
}

struct ShoppingData: Codable {
    let type: String?
    var values: [Value]
    func getValue() -> [Value] {
        values.map { value in
            return value
        }
    }
}

struct Value: Codable {
    let id: Int?
    let name: String?
    let imageURL, bannerURL: String?
    let image: String?
    let actualPrice, offerPrice: String?
    let offer: Int?
    let isExpress: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "image_url"
        case bannerURL = "banner_url"
        case image
        case actualPrice = "actual_price"
        case offerPrice = "offer_price"
        case offer
        case isExpress = "is_express"
    }
}

  
    
