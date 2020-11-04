//
//  URLProtocolStub.swift
//  StarterKit
//
//  Created by Emilio Pavia on 12/12/2019.
//  Copyright © 2019 Emilio Pavia. All rights reserved.
//

import Foundation

open class URLProtocolStub: URLProtocol {
    
    static var loadedRequests = [URLRequest]()
    
    public class func clear() {
        loadedRequests.removeAll()
    }
    
    override open class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    open override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override open func startLoading() {
        guard let client = client else { return }
        
        Self.loadedRequests.append(request)
        
        let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
        client.urlProtocol(self, didReceive: response, cacheStoragePolicy: .allowed)
        client.urlProtocolDidFinishLoading(self)
    }

    override open func stopLoading() {}
}
