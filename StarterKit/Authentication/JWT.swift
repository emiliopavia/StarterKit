//
//  JWT.swift
//  StarterKit
//
//  Created by Emilio Pavia on 06/12/2019.
//  Copyright © 2019 Emilio Pavia. All rights reserved.
//

import Foundation

struct JWT {
    
    let header: [String: Any]
    let payload: [String: Any]
    
    static func decode(string: String) -> JWT? {
        let parts = string.split(separator: ".")
        
        guard parts.count == 3 else { return nil }
        guard let headerData = base64decode(input: String(parts[0])) else { return nil }
        guard let payloadData = base64decode(input: String(parts[1])) else { return nil }
        
        do {
            guard let header = try JSONSerialization.jsonObject(with: headerData, options: []) as? [String: Any] else { return nil }
            guard let payload = try JSONSerialization.jsonObject(with: payloadData, options: []) as? [String: Any] else { return nil }
            
            return JWT(header: header,
                       payload: payload)
        } catch {
            return nil
        }
    }
    
    private static func base64decode(input: String) -> Data? {
        let rem = input.count % 4
        
        var ending = ""
        if rem > 0 {
            let amount = 4 - rem
            ending = String(repeating: "=", count: amount)
        }
        
        let base64 = input.replacingOccurrences(of: "-", with: "+").replacingOccurrences(of: "_", with: "/") + ending
        
        return Data(base64Encoded: base64, options: [.ignoreUnknownCharacters])
    }
}
