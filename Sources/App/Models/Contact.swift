import Fluent
import Vapor

final class Contact: Model, Content {
    static let schema = "contacts"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var name: String

    @Field(key: "email")
    var email: String

    @Field(key: "message")
    var message: String

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    init() { }

    init(id: UUID? = nil, name: String, email: String, message: String) {
        self.id = id
        self.name = name
        self.email = email
        self.message = message
    }
}

struct ContactSubmission: Content {
    let name: String
    let email: String
    let message: String
}
