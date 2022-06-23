//
//  Reachability.swift
//  Shopping
//
//  Created by Alma Midhun on 19/06/22.
//

import Foundation
import Alamofire

final class Reachability: NSObject {
   
    static let shared = Reachability()
    let reachabilityManager = NetworkReachabilityManager()
    
    /// This prevents singleton multiple initialization.
    private override init() { }
    
    func isConnectedToInternet() -> Bool {
        return reachabilityManager?.isReachable ?? false
    }
    
    func startNetworkMonitoring() {
        self.reachabilityManager?.startListening { status in
            switch status {
            case .notReachable:
                debugPrint("No internet connection")
            case .reachable:
                debugPrint("Internet connected")
            case .unknown:
                debugPrint("Unknown internet connection")
            }
        }
    }
    
    func stopNetworkMonitoring() {
        self.reachabilityManager?.stopListening()
    }
}
    
