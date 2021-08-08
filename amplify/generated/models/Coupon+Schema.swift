// swiftlint:disable all
import Amplify
import Foundation

extension Coupon {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case shopID
    case name
    case image
    case detail
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let coupon = Coupon.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.pluralName = "Coupons"
    
    model.attributes(
      .index(fields: ["shopID"], name: "byShop")
    )
    
    model.fields(
      .id(),
      .field(coupon.shopID, is: .optional, ofType: .string),
      .field(coupon.name, is: .required, ofType: .string),
      .field(coupon.image, is: .optional, ofType: .string),
      .field(coupon.detail, is: .optional, ofType: .string),
      .field(coupon.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(coupon.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}