// swiftlint:disable all
import Amplify
import Foundation

extension User {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case username
    case Shops
    case email
    case sub
    case phone_number
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let user = User.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.read, .update])
    ]
    
    model.pluralName = "Users"
    
    model.fields(
      .id(),
      .field(user.username, is: .optional, ofType: .string),
      .hasMany(user.Shops, is: .optional, ofType: Shop.self, associatedWith: Shop.keys.shopmasterID),
      .field(user.email, is: .required, ofType: .string),
      .field(user.sub, is: .optional, ofType: .string),
      .field(user.phone_number, is: .optional, ofType: .string),
      .field(user.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(user.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}