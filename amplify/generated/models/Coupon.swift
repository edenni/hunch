// swiftlint:disable all
import Amplify
import Foundation

public struct Coupon: Model {
  public let id: String
  public var shopID: String?
  public var name: String
  public var image: String?
  public var detail: String?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      shopID: String? = nil,
      name: String,
      image: String? = nil,
      detail: String? = nil) {
    self.init(id: id,
      shopID: shopID,
      name: name,
      image: image,
      detail: detail,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      shopID: String? = nil,
      name: String,
      image: String? = nil,
      detail: String? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.shopID = shopID
      self.name = name
      self.image = image
      self.detail = detail
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}