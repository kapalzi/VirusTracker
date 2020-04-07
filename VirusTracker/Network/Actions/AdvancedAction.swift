//
//  AdvancedAction.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 07/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import Alamofire

enum AdvancedAction: APIAction {
  case comments(postID: Int)
  case photos(albumID: Int)


  var method: HTTPMethod {
    return .get
  }

  var path: String {
    switch self {
    case let .comments(postID):
      return "/posts/\(postID)/comments"
    case let .photos(albumID):
      return "/albums/\(albumID)/photos"
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
