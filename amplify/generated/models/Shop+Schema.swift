// swiftlint:disable all
import Amplify
import Foundation

extension Shop {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case image
    case location
    case max_budget
    case min_budget
    case massage
    case area
    case site_url
    case phone_nunber
    case email
    case shopmasterID
    case Coupons
    case latitude
    case longitude
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let shop = Shop.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.pluralName = "Shops"
    
    model.attributes(
      .index(fields: ["shopmasterID"], name: "byUser")
    )
    
    model.fields(
      .id(),
      .field(shop.name, is: .required, ofType: .string),
      .field(shop.image, is: .optional, ofType: .string),
      .field(shop.location, is: .optional, ofType: .string),
      .field(shop.max_budget, is: .optional, ofType: .int),
      .field(shop.min_budget, is: .optional, ofType: .string),
      .field(shop.massage, is: .optional, ofType: .string),
      .field(shop.area, is: .optional, ofType: .string),
      .field(shop.site_url, is: .optional, ofType: .string),
      .field(shop.phone_nunber, is: .optional, ofType: .string),
      .field(shop.email, is: .optional, ofType: .string),
      .field(shop.shopmasterID, is: .optional, ofType: .string),
      .hasMany(shop.Coupons, is: .optional, ofType: Coupon.self, associatedWith: Coupon.keys.shopID),
      .field(shop.latitude, is: .optional, ofType: .double),
      .field(shop.longitude, is: .optional, ofType: .double),
      .field(shop.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(shop.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}