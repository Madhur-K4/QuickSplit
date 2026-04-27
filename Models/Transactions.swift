import Foundation

struct Transaction: Identifiable {
    let id = UUID()
    var from: String
    var to: String
    var amount: Double
}
