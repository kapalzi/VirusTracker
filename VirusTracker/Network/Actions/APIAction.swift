//
//  APIAction.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 07/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import Alamofire

protocol APIAction: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var actionParameters: [String: Any] { get }
    var baseURL: String { get }
    var authHeader: [String: String] { get }
    var encoding: ParameterEncoding { get }
}

extension APIAction {
    var actionParameters: [String : Any] {
      return [:]
    }
    var authHeader: [String : String] {
      return [:]
    }
    var baseURL: String {
      return "https://api.covid19api.com"
    }
}
