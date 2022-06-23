//
//  FDErrror.swift
//  Shopping
//
//  Created by Alma Midhun on 19/06/22.
//

import Foundation

import Foundation

public enum FDError: Error {
    case defaultError
    case noInternet
   
    
    var localizedDescription: String {
        switch self {
        case .defaultError:
            return "Something went wrong. Try it again."
        case .noInternet:
            return "You are not connected to the Internet."
        default:
            return "Something went wrong. Try it again."
        }
    }
}

struct FDMessages {
    static let defaultError     = "Something went wrong, Please try again."
    static let loginError       = "Login failed! Please check your credentials."
    static let sessionExpired   = "Your session has expired. Please login again"
    static let offline          = "You are not connected to network."
}

extension FDError {
    public var errorDescription: String {
        switch self {
        case .defaultError:
            return FDMessages.defaultError
        case .noInternet:
                return FDMessages.offline
        }
    }
}
