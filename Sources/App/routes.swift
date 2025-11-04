import Fluent
import Vapor

func routes(_ app: Application) throws {
    // Landing page
    app.get { req async throws -> View in
        return try await req.view.render("index")
    }

    // Contact page with form
    app.get("contact") { req async throws -> View in
        return try await req.view.render("contact")
    }

    // Handle contact form submission
    app.post("contact") { req async throws -> Response in
        let submission = try req.content.decode(ContactSubmission.self)

        let contact = Contact(
            name: submission.name,
            email: submission.email,
            message: submission.message
        )

        try await contact.save(on: req.db)

        return req.redirect(to: "/contact/success")
    }

    // Contact success page
    app.get("contact", "success") { req async throws -> View in
        return try await req.view.render("contact-success")
    }

    // Privacy policy page
    app.get("privacy") { req async throws -> View in
        return try await req.view.render("privacy")
    }

    // Future improvements page
    app.get("future-improvements") { req async throws -> View in
        return try await req.view.render("future-improvements")
    }
}
