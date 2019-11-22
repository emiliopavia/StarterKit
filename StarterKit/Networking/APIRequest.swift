//
//  APIRequest.swift
//  StarterKit
//
//  Created by Emilio Pavia on 22/11/2019.
//  Copyright © 2019 Emilio Pavia. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case get, post, put, delete
}

public enum ResponseError: Error {
    case networkError(Error?)
    case httpError(Int)
    case unauthorized
}

public typealias APIResponse = Result<Data, ResponseError>
public typealias APIResponseHandler = (APIResponse) -> Void

public protocol APIRequest {
    var method: HTTPMethod { get }
    var endpoint: String? { get }
    var parameters: [String: String?]? { get }
    var headers: [String: String]? { get }
    var contentType: String { get }
    var body: Data? { get }
    var responseHandler: APIResponseHandler { get }
}
