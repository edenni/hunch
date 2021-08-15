// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "66f6d2dc9b58c39d64969021fcab2a4d"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Coupon.self)
    ModelRegistry.register(modelType: User.self)
    ModelRegistry.register(modelType: Shop.self)
  }
}