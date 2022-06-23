//
//  HomeAPIRouter.swift
//  Shopping
//
//  Created by Alma Midhun on 19/06/22.
//

import Foundation
import Alamofire

enum HomeAPIRouter: APIRouter {
    
    case getCategories
    case getBanners
    case getProducts

    
    var path: String {
        switch self {
            case .getCategories:
                return "https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0"
            case .getBanners:
                return "https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0"
            case .getProducts:
                return "https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0"
        }
    }
    
    internal var requestURL: URL {
        return URL(string: path)!
        
    }
    
    var method: HTTPMethod {
        return .get
    }
    
//    var headers: [String : String]? {
//        return getAuthHeader()
//    }
//
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var parameters: Parameters? {
        switch self {
            case .getCategories,
                 .getBanners,
                 .getProducts:
                return [:]
            default:
                return nil
        }
    }
    
    var contentType: String {
        return "application/json"
        
    }
}
