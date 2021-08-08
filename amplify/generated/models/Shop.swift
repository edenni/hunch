// swiftlint:disable all
import Amplify
import Foundation

public struct Shop: Model {
  public let id: String
  public var name: String
  public var image: String?
  public var location: String?
  public var max_budget: Int?
  public var min_budget: String?
  public var massage: String?
  public var area: String?
  public var site_url: String?
  public var phone_nunber: String?
  public var email: String?
  public var shopmasterID: String?
  public var Coupons: List<Coupon>?
  public var latitude: Double?
  public var longitude: Double?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      name: String,
      image: String? = nil,
      location: String? = nil,
      max_budget: Int? = nil,
      min_budget: String? = nil,
      massage: String? = nil,
      area: String? = nil,
      site_url: String? = nil,
      phone_nunber: String? = nil,
      email: String? = nil,
      shopmasterID: String? = nil,
      Coupons: List<Coupon>? = [],
      latitude: Double? = nil,
      longitude: Double? = nil) {
    self.init(id: id,
      name: name,
      image: image,
      location: location,
      max_budget: max_budget,
      min_budget: min_budget,
      massage: massage,
      area: area,
      site_url: site_url,
      phone_nunber: phone_nunber,
      email: email,
      shopmasterID: shopmasterID,
      Coupons: Coupons,
      latitude: latitude,
      longitude: longitude,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      name: String,
      image: String? = nil,
      location: String? = nil,
      max_budget: Int? = nil,
      min_budget: String? = nil,
      massage: String? = nil,
      area: String? = nil,
      site_url: String? = nil,
      phone_nunber: String? = nil,
      email: String? = nil,
      shopmasterID: String? = nil,
      Coupons: List<Coupon>? = [],
      latitude: Double? = nil,
      longitude: Double? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.name = name
      self.image = image
      self.location = location
      self.max_budget = max_budget
      self.min_budget = min_budget
      self.massage = massage
      self.area = area
      self.site_url = site_url
      self.phone_nunber = phone_nunber
      self.email = email
      self.shopmasterID = shopmasterID
      self.Coupons = Coupons
      self.latitude = latitude
      self.longitude = longitude
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}
