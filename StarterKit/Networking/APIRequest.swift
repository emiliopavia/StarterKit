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
    case unauthorized
    case badRequest(Data?)
    case httpError(Int)
    case badResponse
}

public typealias APIResponse = Result<Data, ResponseError>
public typealias APIResponseHandler = (APIResponse) -> Void

public protocol APIRequest {
    var method: HTTPMethod { get }
    var endpoint: String? { get }
    var headers: [String: String]? { get }
    var parameters: [String: String?]? { get }
    var contentType: String? { get }
    var responseHandler: APIResponseHandler { get }
}
