//
//  Data.swift
//  DubizzlesClassifieds
//
//  Created by Shahzaib Iqbal Bhatti on 3/8/21.
//

import Foundation
extension Data {
    
    public func getJSONFromData() -> [String: Any]? {
        do {
            if let json = try JSONSerialization.jsonObject(with: self, options: .allowFragments) as? [String: Any] {
                return json
            }
        } catch let error as NSError {
            fatalError("""
                Domain: \(error.domain)
                Code: \(error.code)
                Description: \(error.localizedDescription)
                Failure Reason: \(error.localizedFailureReason ?? "")
                Suggestions: \(error.localizedRecoverySuggestion ?? "")
                """)
        }
        
        return nil
    }
}
