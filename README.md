# 📋 Task MasterList

> A modern, feature-rich task management application built with Ruby on Rails 8

[![Ruby on Rails](https://img.shields.io/badge/Ruby_on_Rails-8.0-CC0000?logo=ruby-on-rails)](https://rubyonrails.org/)
[![Ruby Version](https://img.shields.io/badge/Ruby-3.4.1-red?logo=ruby)](https://www.ruby-lang.org/)
[![Bootstrap](https://img.shields.io/badge/Bootstrap-5.3-7952B3?logo=bootstrap)](https://getbootstrap.com/)
[![Live Demo](https://img.shields.io/badge/Live_Demo-Netlify-00C7B7?logo=netlify)](https://task-masterlist.netlify.app/)

**[🚀 Live Demo](https://task-masterlist.netlify.app/)**

## ✨ Overview

Task MasterList is a sophisticated task management application designed to showcase modern web development practices and create an impressive portfolio piece. Built with Ruby on Rails 8, it demonstrates full-stack development capabilities with a focus on user experience, performance, and scalability.

### 🎯 Key Highlights

- **Modern UI/UX**: Gradient backgrounds, smooth animations, and responsive design
- **Advanced Features**: Priority levels, categories, due dates, and progress tracking
- **Smart Filtering**: Search functionality with category and status filters
- **Real-time Statistics**: Dynamic dashboard with task analytics
- **Portfolio-Ready**: Clean code architecture with comprehensive documentation

## 🚀 Features

### 📊 **Dashboard & Analytics**
- Real-time task statistics with visual indicators
- Completion percentage tracking
- Overdue task monitoring
- Category-based task distribution

### 🔍 **Advanced Search & Filtering**
- Full-text search across titles and descriptions
- Filter by category (Work, Personal, Health, Finance, Education, etc.)
- Status filtering (Pending, Completed, Overdue, Due Today)
- Multiple sorting options (Priority, Due Date, Category, Latest)

### 📝 **Task Management**
- **CRUD Operations**: Create, Read, Update, Delete tasks
- **Priority Levels**: 5-tier priority system (Critical, High, Medium, Low, Minimal)
- **Categories**: 10 predefined categories for better organization
- **Due Dates**: DateTime picker with progress tracking
- **Rich Descriptions**: Full text descriptions with formatting support

### 🎨 **Modern User Interface**
- **Responsive Design**: Mobile-first approach with Bootstrap 5.3
- **Card-based Layout**: Clean, modern task cards with hover effects
- **Gradient Themes**: Beautiful color gradients throughout the UI
- **Smooth Animations**: CSS transitions and keyframe animations
- **Dark Mode Support**: Automatic dark mode based on system preferences

### 📱 **User Experience**
- **Progress Visualization**: Progress bars for time-sensitive tasks
- **Status Indicators**: Visual cues for overdue and urgent tasks
- **Intuitive Navigation**: Breadcrumbs and clear navigation paths
- **Form Validation**: Client and server-side validation with error handling

## 🛠 Technology Stack

### **Backend**
- **Ruby on Rails 8.0.1**: Modern web framework with latest features
- **Ruby 3.4.1**: Latest stable Ruby version
- **SQLite3**: Lightweight, serverless database
- **Solid Queue**: Background job processing
- **Solid Cache**: Database-backed caching
- **Solid Cable**: WebSocket connections

### **Frontend**
- **Bootstrap 5.3**: Responsive UI framework
- **Sass**: Advanced CSS preprocessing
- **Turbo**: SPA-like page acceleration
- **Stimulus**: JavaScript framework for enhanced interactivity
- **Bootstrap Icons**: Comprehensive icon library

### **Development & Deployment**
- **Kamal**: Modern deployment tool
- **Docker**: Containerization support
- **Brakeman**: Security vulnerability scanning
- **RuboCop**: Code style and quality enforcement
- **Propshaft**: Modern asset pipeline

## 🏗 Architecture

### **Database Schema**
```ruby
create_table "tasks" do |t|
  t.string "title", null: false
  t.text "description"
  t.boolean "completed", default: false
  t.integer "priority", null: false         # 1-5 priority levels
  t.string "category", null: false          # Predefined categories
  t.datetime "due_date"                     # Optional due date
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
end
```

### **Model Features**
- **Validations**: Title presence, priority range, category validation
- **Scopes**: Filtering by completion status, priority, due dates
- **Methods**: Progress calculation, status helpers, date formatting
- **Constants**: Priority labels with colors and icons, category definitions

### **Controller Logic**
- **Search**: Full-text search across multiple fields
- **Filtering**: Category, status, and date-based filtering
- **Sorting**: Multiple sorting options with persistence
- **Statistics**: Real-time calculation of task metrics

## 📦 Installation

### Prerequisites
- Ruby 3.4.1
- Rails 8.0.1
- SQLite3
- Node.js (for asset compilation)

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/task-masterlist.git
   cd task-masterlist
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Database setup**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed  # Creates sample data for demonstration
   ```

4. **Start the development server**
   ```bash
   rails server
   # or use the development script
   bin/dev
   ```

5. **Access the application**
   Open [http://localhost:3000](http://localhost:3000) in your browser

## 🚀 Deployment

### **Production with Kamal**
```bash
# Configure deployment settings
edit config/deploy.yml

# Set up secrets
edit .kamal/secrets

# Deploy
bin/kamal setup    # First time
bin/kamal deploy   # Updates
```

### **Docker Deployment**
```bash
# Build the image
docker build -t task-masterlist .

# Run container
docker run -d -p 80:80 \
  -e RAILS_MASTER_KEY=your-master-key \
  --name task-masterlist task-masterlist
```

### **Environment Variables**
- `RAILS_MASTER_KEY`: Encryption key for credentials
- `RAILS_ENV`: Set to `production` for production deployment
- `DATABASE_URL`: Database connection string (if using external DB)

## 🧪 Testing

```bash
# Run all tests
rails test

# System tests (browser-based)
rails test:system

# Security scan
bin/brakeman

# Code style check
bin/rubocop
```

## 📈 Performance Features

- **Optimized Queries**: Efficient database queries with proper indexing
- **Caching**: Solid Cache for improved performance
- **Asset Optimization**: Modern asset pipeline with compression
- **Background Jobs**: Non-blocking operations with Solid Queue
- **Responsive Images**: Optimized image loading

## 🎨 Design System

### **Color Palette**
- **Primary**: Purple gradient (#667eea → #764ba2)
- **Success**: Blue gradient (#4facfe → #00f2fe)
- **Warning**: Pink-yellow gradient (#fa709a → #fee140)
- **Danger**: Red-orange gradient (#ff6b6b → #feca57)

### **Typography**
- **Primary Font**: Inter, Segoe UI, system fonts
- **Headings**: Font weights 600-800 with letter spacing
- **Body Text**: Optimized line height and spacing

### **Components**
- **Cards**: Glass morphism effect with backdrop blur
- **Buttons**: Hover animations with shadow effects
- **Forms**: Modern styling with focus states
- **Icons**: Bootstrap Icons for consistency

## 🔧 API Reference

### Task Model Methods
```ruby
# Status helpers
task.overdue?           # Boolean: Is task overdue?
task.due_today?         # Boolean: Is task due today?
task.due_soon?          # Boolean: Due within 3 days?

# Display helpers
task.priority_label     # String: Human-readable priority
task.priority_color     # String: Bootstrap color class
task.formatted_due_date # String: Formatted due date
task.progress_percentage # Integer: Time-based progress
```

### Scopes
```ruby
Task.completed          # Completed tasks
Task.pending           # Pending tasks
Task.overdue           # Overdue tasks
Task.due_today         # Due today
Task.by_priority       # Sorted by priority
Task.by_due_date       # Sorted by due date
Task.by_category(cat)  # Filtered by category
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines
- Follow Rails conventions and best practices
- Write comprehensive tests for new features
- Maintain code style with RuboCop
- Update documentation for API changes
- Run security checks with Brakeman

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- **Ruby on Rails Team**: For the amazing framework
- **Bootstrap Team**: For the responsive UI framework  
- **Bootstrap Icons**: For the comprehensive icon library
- **Netlify**: For providing excellent hosting services

## 📞 Contact & Portfolio

**Developer**: [Your Name]
- **Portfolio**: [Your Portfolio Website]
- **LinkedIn**: [Your LinkedIn Profile]
- **GitHub**: [Your GitHub Profile]
- **Email**: [Your Email]

---

⭐ **Star this repository if you find it helpful!**

*Built with ❤️ using Ruby on Rails 8*
