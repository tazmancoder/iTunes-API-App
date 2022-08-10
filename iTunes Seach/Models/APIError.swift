//
//  APIError.swift
//  iTunes Seach
//
//  Created by Mark Perryman on 8/10/22.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    case invalidURL
    case urlSession(URLError?)
    case badResponse(Int)
    case decodingError(DecodingError?)
    case unknown

    var description: String {
        switch self {
        case .invalidURL:
            return "Invalid URL created"
        case .urlSession(let urlError):
            return "URL Session Error: \(urlError.debugDescription)"
        case .badResponse(let responseCode):
            return "Bad API Response with status code: \(responseCode)"
        case .decodingError(let decodingError):
            return "Decoding Error: \(decodingError.debugDescription)"
        case .unknown:
            return "Unknown Error"
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL created"
        case .urlSession(let urlError):
            return urlError?.localizedDescription ?? "Unkownn Error"
        case .badResponse(let statusCode):
            return "Bad API Response with status code: \(statusCode)"
        case .decodingError(let decodingError):
            return decodingError?.localizedDescription ?? "Unknown Error"
        case .unknown:
            return "Unknown Error"
        }
    }
}
