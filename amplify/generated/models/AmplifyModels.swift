// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "75f241b4de8757c17ab10d81349f14c4"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Coupon.self)
    ModelRegistry.register(modelType: User.self)
    ModelRegistry.register(modelType: Shop.self)
  }
}