# Task Manager

A modern, responsive task management application built with Ruby on Rails 8. Features a clean Bootstrap-styled interface for creating, managing, and tracking tasks with completion status.

## Overview

This is a full-featured CRUD (Create, Read, Update, Delete) task management application that allows users to:

- Create new tasks with titles and completion status
- View all tasks in a clean, organized interface
- Edit existing tasks
- Mark tasks as completed/pending
- Delete tasks
- Responsive design that works on desktop and mobile devices

The application uses Rails 8's modern stack including Solid Queue for background jobs, Solid Cache for caching, and SQLite for the database.

## Dependencies

### System Requirements
- **Ruby**: 3.4.1 (specified in `.ruby-version`)
- **Rails**: 8.0.1
- **SQLite3**: 2.1+
- **Node.js**: For asset compilation (if needed)

### Key Gems
- **Rails 8.0.1**: Web framework
- **SQLite3**: Database
- **Bootstrap 5.3**: UI framework and styling
- **Puma**: Web server
- **Turbo Rails**: SPA-like page acceleration
- **Stimulus**: JavaScript framework
- **Solid Queue**: Background job processing
- **Solid Cache**: Database-backed caching
- **Solid Cable**: WebSocket connections

### Development Dependencies
- **Brakeman**: Security vulnerability scanner
- **RuboCop Rails Omakase**: Code style and linting
- **Capybara & Selenium**: System testing
- **Debug**: Debugging tools

## How It Works

### Architecture
The application follows Rails MVC (Model-View-Controller) architecture:

- **Model**: `Task` model with title and completion status
- **Controller**: `TasksController` handles all CRUD operations
- **Views**: Bootstrap-styled ERB templates for user interface

### Database Schema
```ruby
# Tasks table
create_table "tasks" do |t|
  t.string "title"
  t.boolean "completed"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
end
```

### Key Features
- **Validation**: Tasks require a title (1-255 characters)
- **Scopes**: Built-in scopes for completed, pending, and recent tasks
- **Responsive Design**: Mobile-first Bootstrap styling
- **Modern Rails**: Uses Rails 8 features like Solid Queue and modern asset pipeline

### File Structure
```
app/
├── controllers/tasks_controller.rb    # Main controller
├── models/task.rb                     # Task model with validations
├── views/tasks/                       # All task-related views
└── assets/stylesheets/application.css # Custom styling

config/
├── routes.rb                          # URL routing
└── database.yml                       # Database configuration

db/
├── migrate/                           # Database migrations
└── seeds.rb                          # Sample data
```

## Installation & Setup

1. **Clone and setup**:
   ```bash
   git clone <repository-url>
   cd todo_app
   bundle install
   ```

2. **Database setup**:
   ```bash
   rails db:migrate
   rails db:seed  # Optional: loads sample tasks
   ```

3. **Start the server**:
   ```bash
   rails server
   # or use the dev script
   bin/dev
   ```

4. **Access the application**:
   Open http://localhost:3000 in your browser

## Deployment

### Production Deployment with Kamal

This application is configured for deployment using **Kamal** (Rails' deployment tool):

1. **Configure deployment**:
   ```bash
   # Edit config/deploy.yml with your server details
   # Set up .kamal/secrets with required credentials
   ```

2. **Deploy**:
   ```bash
   bin/kamal setup    # First time setup
   bin/kamal deploy   # Deploy updates
   ```

### Docker Deployment

The application includes a production-ready Dockerfile:

```bash
# Build the image
docker build -t task-manager .

# Run the container
docker run -d -p 80:80 \
  -e RAILS_MASTER_KEY=<your-master-key> \
  --name task-manager task-manager
```

### Traditional Deployment

For deployment to platforms like Heroku, DigitalOcean, or AWS:

1. **Set environment variables**:
   - `RAILS_MASTER_KEY`: From `config/master.key`
   - `RAILS_ENV=production`

2. **Database setup**:
   ```bash
   RAILS_ENV=production rails db:migrate
   ```

3. **Asset compilation**:
   ```bash
   RAILS_ENV=production rails assets:precompile
   ```

## Testing

Run the test suite:
```bash
# All tests
rails test

# System tests (browser-based)
rails test:system

# Security scan
bin/brakeman

# Code style check
bin/rubocop
```

## Configuration

### Environment Variables
- `RAILS_MASTER_KEY`: Required for production (encryption key)
- `RAILS_ENV`: Set to `production` for production deployment
- `PORT`: Server port (default: 3000)

### Database
- **Development/Test**: SQLite (stored in `storage/`)
- **Production**: SQLite with separate databases for cache, queue, and cable

## License

This project is open source under the MIT License.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests: `rails test`
5. Submit a pull request

---

Built with ❤️ using Ruby on Rails 8