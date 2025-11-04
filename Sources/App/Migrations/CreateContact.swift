import Fluent

struct CreateContact: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("contacts")
            .id()
            .field("name", .string, .required)
            .field("email", .string, .required)
            .field("message", .string, .required)
            .field("created_at", .datetime)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("contacts").delete()
    }
}
