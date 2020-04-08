//
//  ArrayResource.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 07/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import RxSwift

struct ArrayResource<T: Codable> {
    
  let objectType = T.self
  let action: APIAction

  func parse(_ data: Data) -> Observable<[T]> {
    return Observable.create { observer in
      guard let result = try? JSONDecoder().decode([T].self, from: data) else {
        observer.onError(CustomError(value: "Can't map response."))
        return Disposables.create()
      }
      observer.onNext(result)
      return Disposables.create()
    }
  }
}
