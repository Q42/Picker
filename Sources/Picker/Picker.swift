//
//  Picker.swift
//  Picker
//
//  Created by Tom Lokhorst on 2017-04-24.
//  Copyright © 2017 Q42. All rights reserved.
//

import Promissum

public typealias PickerPromise<Value> = Promise<PickerResult<Value>, PickerError>
public typealias MandatoryPickerPromise<Value> = Promise<Value, PickerError>

public enum PickerError: Swift.Error {
  case interrupted
}

public enum PickerResult<Value> {
  case completed(Value)
  case cancelled

  public var value: Value? {
    if case .completed(let value) = self {
      return value
    }

    return nil
  }
}

public protocol MappablePickerResult {
  associatedtype Value
  func map<NewValue>(_ transform: (Value) -> NewValue) -> PickerResult<NewValue>
}

extension PickerResult: MappablePickerResult {
  public func map<NewValue>(_ transform: (Value) -> NewValue) -> PickerResult<NewValue> {
    switch self {
    case .completed(let value):
      return .completed(transform(value))
    case .cancelled:
      return .cancelled
    }
  }
}

extension Promise where Value: MappablePickerResult, Error == PickerError {
  public func map<NewValue>(_ transform: @escaping (Value.Value) -> NewValue) -> PickerPromise<NewValue> {
    return self.map { $0.map(transform) }
  }
}

public class Picker<Value> {

  private let source = Promissum.PromiseSource<PickerResult<Value>, PickerError>()
  public var promise: PickerPromise<Value> { return source.promise }

  public init() {}

  deinit {
    source.reject(.interrupted)
  }

  public func complete(with value: Value) {
    source.resolve(.completed(value))
  }

  public func cancel() {
    source.resolve(.cancelled)
  }
}

public class MandatoryPicker<Value> {

  private let source = Promissum.PromiseSource<Value, PickerError>()
  public var promise: MandatoryPickerPromise<Value> { return source.promise }

  public init() {}

  deinit {
    source.reject(.interrupted)
  }

  public func complete(with value: Value) {
    source.resolve(value)
  }
}
