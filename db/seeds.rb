# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing tasks in development
if Rails.env.development?
  Task.destroy_all
end

# Create sample tasks
sample_tasks = [
  { title: "Set up development environment", completed: true },
  { title: "Create user authentication system", completed: false },
  { title: "Design database schema", completed: true },
  { title: "Implement task CRUD operations", completed: true },
  { title: "Add task filtering and search", completed: false },
  { title: "Write comprehensive tests", completed: false },
  { title: "Deploy to production", completed: false },
  { title: "Set up monitoring and logging", completed: false }
]

sample_tasks.each do |task_attrs|
  Task.find_or_create_by(title: task_attrs[:title]) do |task|
    task.completed = task_attrs[:completed]
  end
end

puts "Created #{Task.count} tasks"