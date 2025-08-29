# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing tasks in development
if Rails.env.development?
  Task.destroy_all
end

# Create comprehensive sample tasks for portfolio demonstration
sample_tasks = [
  {
    title: "Launch new marketing campaign",
    description: "Coordinate with marketing team to launch Q4 product campaign across all social media channels",
    category: "Work",
    priority: 1,
    due_date: 2.days.from_now,
    completed: false
  },
  {
    title: "Complete React.js certification",
    description: "Finish the advanced React course and obtain certification to improve frontend development skills",
    category: "Education",
    priority: 2,
    due_date: 1.week.from_now,
    completed: false
  },
  {
    title: "Organize team building event",
    description: "Plan and execute quarterly team building activities for the development team",
    category: "Work",
    priority: 3,
    due_date: 3.weeks.from_now,
    completed: true
  },
  {
    title: "Update investment portfolio",
    description: "Review and rebalance investment portfolio based on current market conditions",
    category: "Finance",
    priority: 2,
    due_date: 5.days.from_now,
    completed: false
  },
  {
    title: "Annual health checkup",
    description: "Schedule and complete annual physical examination and dental cleaning",
    category: "Health",
    priority: 2,
    due_date: 1.day.ago,
    completed: false
  },
  {
    title: "Plan weekend trip to mountains",
    description: "Research and book accommodation for weekend hiking trip with family",
    category: "Travel",
    priority: 4,
    due_date: 2.weeks.from_now,
    completed: false
  },
  {
    title: "Implement CI/CD pipeline",
    description: "Set up automated testing and deployment pipeline using GitHub Actions for the project",
    category: "Projects",
    priority: 1,
    due_date: Time.current,
    completed: false
  },
  {
    title: "Buy groceries for the week",
    description: "Purchase fresh vegetables, fruits, and essential household items from the local market",
    category: "Shopping",
    priority: 3,
    due_date: 1.day.from_now,
    completed: true
  },
  {
    title: "Call mom for birthday",
    description: "Wish mom happy birthday and catch up on family news",
    category: "Family",
    priority: 1,
    due_date: 3.days.from_now,
    completed: false
  },
  {
    title: "Read 'Clean Architecture' book",
    description: "Complete reading Robert Martin's book on software architecture principles",
    category: "Education",
    priority: 4,
    due_date: 1.month.from_now,
    completed: false
  },
  {
    title: "Update LinkedIn profile",
    description: "Add recent project achievements and update skills section on LinkedIn profile",
    category: "Personal",
    priority: 3,
    due_date: 1.week.from_now,
    completed: true
  },
  {
    title: "File tax returns",
    description: "Complete and submit annual tax returns with all necessary documentation",
    category: "Finance",
    priority: 1,
    due_date: 2.days.ago,
    completed: false
  },
  {
    title: "Setup home office ergonomics",
    description: "Adjust desk height, monitor position, and chair settings for better work posture",
    category: "Health",
    priority: 3,
    due_date: 3.days.from_now,
    completed: true
  },
  {
    title: "Research vacation destinations",
    description: "Compare and research potential destinations for annual summer vacation",
    category: "Travel",
    priority: 5,
    due_date: 2.months.from_now,
    completed: false
  },
  {
    title: "Contribute to open source project",
    description: "Make meaningful contributions to a popular Ruby on Rails open source project",
    category: "Projects",
    priority: 4,
    due_date: 3.weeks.from_now,
    completed: false
  }
]

sample_tasks.each do |task_attrs|
  Task.create!(task_attrs)
end

puts "Created #{Task.count} demo tasks with various priorities, categories, and due dates"
