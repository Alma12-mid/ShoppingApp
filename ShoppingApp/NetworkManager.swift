//
//  NetworkManager.swift
//  Shopping
//
//  Created by Alma Midhun on 19/06/22.
//

import Foundation
import Alamofire

//func getAuthHeader() -> [String: String]? {
//    var header = ["Basic-Auth": ""]
//    if let token = UserValues.token {
//        header ["Authorization"] = "Bearer " + token
//    }
  //  return header
//}

class NetworkManager {
    
    public static func request<T: Decodable> (route: APIRouter,
                                             completion: @escaping (Result<T, FDError>) -> Void) {
        
        guard Reachability.shared.isConnectedToInternet() == true else {
            completion(.failure(.noInternet))
            return
        }
    
        AF.request(route)
            .responseJSON { (response) in
                
                 debugPrint("Result# \(String(describing: response.request?.url)) \n Headers: \(String(describing: response.request?.headers)) \n Body: \(String(describing: response.request?.httpBody))   Response: \(String(describing: response.value))")
                
                switch response.result {
                case .success:
                    
                    guard let data = response.data else {
                        completion(.failure(.defaultError))
                        return
                    }
                        do {
                           // process data
                            let decoder = JSONDecoder()
                            let model = try decoder.decode(T.self, from: data)
                            completion(.success(model))
                            
                        } catch let DecodingError.dataCorrupted(context) {
                            debugPrint(context)
                        } catch let DecodingError.keyNotFound(key, context) {
                            debugPrint("Key '\(key)' not found:", context.debugDescription)
                            debugPrint("codingPath:", context.codingPath)
                        } catch let DecodingError.valueNotFound(value, context) {
                            debugPrint("Value '\(value)' not found:", context.debugDescription)
                            debugPrint("codingPath:", context.codingPath)
                        } catch let DecodingError.typeMismatch(type, context)  {
                            debugPrint("Type '\(type)' mismatch:", context.debugDescription)
                            debugPrint("codingPath:", context.codingPath)
                        } catch {
                            debugPrint("error: ", error)
                        }
                case let .failure: break
                }       
        }
    }

}
