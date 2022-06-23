//
//  APIRouter.swift
//  Shopping
//
//  Created by Alma Midhun on 19/06/22.
//

import Foundation
import Alamofire

protocol APIRouter: URLRequestConvertible {
    
    var requestURL: URL { get }
    
    var method: HTTPMethod { get }
    
 //   var headers: [String: String]? { get }
    
    var encoding: ParameterEncoding { get }
    
    var parameters: Parameters? { get }
    
    var contentType: String { get }
}

extension APIRouter {
    
    var contentType: String {
        return "application/json"
    }
    
    // MARK: - URLRequestConvertible
    //
    func asURLRequest() throws -> URLRequest {
        
        var urlRequest = URLRequest(url: requestURL)
        debugPrint("API", requestURL)
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        // Adding Headers
//        headers?.forEach {
//            urlRequest.addValue($0.value, forHTTPHeaderField: $0.key)
//        }
        
        // Parameters
        if let parameters = parameters {
            do {
                switch method {
                case .get:
                    return try encoding.encode(urlRequest, with: parameters)
                case .post:
                    urlRequest.setValue(contentType, forHTTPHeaderField: "Content-Type")
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                default:
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                    urlRequest.setValue(contentType, forHTTPHeaderField: "Content-Type")
                }
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
