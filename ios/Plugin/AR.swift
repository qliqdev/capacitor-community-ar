import Foundation

@objc public class AR: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
