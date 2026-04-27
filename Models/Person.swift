import Foundation

struct Person: Identifiable, Hashable {
    let id = UUID()
    var name: String
}
