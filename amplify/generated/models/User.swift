// swiftlint:disable all
import Amplify
import Foundation

public struct User: Model {
  public let id: String
  public var username: String?
  public var Shops: List<Shop>?
  public var email: String
  public var sub: String?
  public var phone_number: String?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      username: String? = nil,
      Shops: List<Shop>? = [],
      email: String,
      sub: String? = nil,
      phone_number: String? = nil) {
    self.init(id: id,
      username: username,
      Shops: Shops,
      email: email,
      sub: sub,
      phone_number: phone_number,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      username: String? = nil,
      Shops: List<Shop>? = [],
      email: String,
      sub: String? = nil,
      phone_number: String? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.username = username
      self.Shops = Shops
      self.email = email
      self.sub = sub
      self.phone_number = phone_number
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}