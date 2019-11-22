//
//  URLProtocolMock.swift
//  StarterKit
//
//  Created by Emilio Pavia on 22/11/2019.
//  Copyright © 2019 Emilio Pavia. All rights reserved.
//

import Foundation

public struct URLResponseStub {
    
    public let data: Data?
    public let response: URLResponse?
    public let error: Error?
    
    public init(data: Data?, url: URL, statusCode: Int, httpVersion: String? = "1.1", headerFields: [String: String]? = nil) {
        let response = HTTPURLResponse(url: url,
                                       statusCode: statusCode,
                                       httpVersion: httpVersion,
                                       headerFields: headerFields)
        self.init(data: data, response: response)
    }
    
    public init(data: Data?, response: URLResponse?) {
        self.data = data
        self.response = response
        self.error = nil
    }
    
    public init(error: Error?) {
        self.data = nil
        self.response = nil
        self.error = error
    }
}

open class URLProtocolMock: URLProtocol {
    
    private static var stubs = [URLRequest: URLResponseStub]()

    public class func set(_ response: URLResponseStub, for request: URLRequest) {
        stubs[request] = response
    }
    
    public class func response(for request: URLRequest) -> URLResponseStub? {
        stubs[request]
    }
    
    override open class func canInit(with request: URLRequest) -> Bool {
        return response(for: request) != nil
    }

    override open class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override open func startLoading() {
        guard let client = client else { return }
        
        if let stub = Self.response(for: request) {
            if let error = stub.error {
                client.urlProtocol(self, didFailWithError: error)
            }
            if let response = stub.response {
                client.urlProtocol(self, didReceive: response, cacheStoragePolicy: .allowed)
            }
            if let data = stub.data {
                client.urlProtocol(self, didLoad: data)
            }
        }
        
        client.urlProtocolDidFinishLoading(self)
    }

    override open func stopLoading() {}
}
