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
    case networkError(NSError?)
    case badRequest(Data?)
    case unauthorized
    case serverError
    case httpError(Int)
    
    case badResponse
}

public typealias APIResponse = Result<Data, ResponseError>
public typealias APIResponseHandler = (APIResponse) -> Void

public protocol APIRequest: CustomDebugStringConvertible {
    var method: HTTPMethod { get }
    var endpoint: String? { get }
    var headers: [String: String]? { get }
    var parameters: [String: String?]? { get }
    var contentType: String? { get }
    var responseHandler: APIResponseHandler { get }
}
