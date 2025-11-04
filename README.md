# Mile Square Sweeping Server

A Swift Vapor web server with SQLite database for managing contact form submissions, landing page, and privacy policy.

## Features

- **Landing Page** (`/`) - Welcome page with app information
- **Contact Form** (`/contact`) - Form for users to submit inquiries
- **Privacy Policy** (`/privacy`) - Privacy policy page
- **SQLite Database** - Stores contact form submissions

## Requirements

- Swift 5.9+
- macOS 13.0+

## Installation

1. Clone the repository
2. Run the following command to build and run:

```bash
swift run
```

The server will start on `http://localhost:8080` by default.

## Project Structure

```
server/
├── Package.swift                  # Swift package dependencies
├── Sources/
│   └── App/
│       ├── entrypoint.swift      # Application entry point
│       ├── configure.swift       # App configuration
│       ├── routes.swift          # Route definitions
│       ├── Models/
│       │   └── Contact.swift     # Contact model
│       └── Migrations/
│           └── CreateContact.swift # Database migration
└── Resources/
    └── Views/
        ├── index.leaf            # Landing page template
        ├── contact.leaf          # Contact form template
        ├── contact-success.leaf  # Success message template
        └── privacy.leaf          # Privacy policy template
```

## Routes

- `GET /` - Landing page
- `GET /contact` - Contact form
- `POST /contact` - Submit contact form
- `GET /contact/success` - Success confirmation page
- `GET /privacy` - Privacy policy

## Database

Contact submissions are stored in an SQLite database (`db.sqlite`) with the following schema:

```sql
contacts
  - id (UUID)
  - name (String)
  - email (String)
  - message (String)
  - created_at (DateTime)
```

## Development

To run in development mode:

```bash
swift run App serve --env development
```

To build for production:

```bash
swift build -c release
```

## Customization

- Edit templates in `Resources/Views/` to customize the look and feel
- Modify `Sources/App/routes.swift` to add or change routes
- Update `Sources/App/Models/Contact.swift` to add more fields to the contact form
