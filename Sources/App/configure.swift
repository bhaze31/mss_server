import Fluent
import FluentSQLiteDriver
import Leaf
import Vapor

public func configure(_ app: Application) async throws {
    // Configure database
    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)

    // Configure Leaf for rendering HTML templates
    app.views.use(.leaf)

    // Add migrations
    app.migrations.add(CreateContact())

    // Run migrations automatically
    try await app.autoMigrate()

    // Register routes
    try routes(app)
}
