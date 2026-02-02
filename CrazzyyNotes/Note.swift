
import SwiftData
import Foundation

@Model
class Note {
    var content: String
    var createdAt: Date
    var updatedAt: Date

    init(content: String = "") {
        self.content = content
        self.createdAt = Date()
        self.updatedAt = Date()
    }
}
