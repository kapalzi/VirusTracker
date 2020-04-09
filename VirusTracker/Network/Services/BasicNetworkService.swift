//
//  BasicNetworkService.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 07/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import RxSwift
import RxAlamofire

struct BasicNetworkService: NetworkService {

  func load<T>(_ resource: SingleItemResource<T>) -> Observable<T> where T : Codable {
    return
      RxAlamofire
        .request(resource.action)
        .responseJSON()
        .map {
            $0.data ?? Data() }
        .filter { $0 != nil }
        .map { $0! }
        .flatMap(resource.parse)
  }

  func load<T>(_ resource: ArrayResource<T>) -> Observable<[T]> where T : Codable {
    return
      RxAlamofire
        .request(resource.action)
        .responseJSON()
        .map {
            $0.data ?? Data() }
        .flatMap(resource.parse)
  }
}

