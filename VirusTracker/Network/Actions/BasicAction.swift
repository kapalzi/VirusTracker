//
//  BasicAction.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 07/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import Alamofire

enum BasicAction: APIAction {
    
  case summary

  var method: HTTPMethod {
    return .get
  }
  
  var path: String {
    switch self {
    case .summary:
      return "/summary"
    }
  }
  var encoding: ParameterEncoding {
    return URLEncoding.default
  }
  
  func asURLRequest() throws -> URLRequest {
    let originalRequest = try URLRequest(url: baseURL.appending(path),
                                         method: method,
                                         headers: authHeader)
    let encodedRequest = try encoding.encode(originalRequest,
                                             with: actionParameters)
    return encodedRequest
  }
}
