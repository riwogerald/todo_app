# Task Manager App

A simple Ruby on Rails application for managing tasks.

## Prerequisites

- Ruby installed (version 3.0 or later recommended)
- Rails installed (`gem install rails`)
- SQLite3 installed
- Git (optional, for version control)

## Installation

1. **Clone the repository** (if applicable):

   ```sh
   git clone https://github.com/your-username/todo_app.git
   cd todo_app
   ```

2. **Install dependencies:**

   ```sh
   bundle install
   ```

3. **Set up the database:**

   ```sh
   rails db:migrate
   ```

## Running the Application

1. **Start the Rails server:**

   ```sh
   rails server
   ```

2. Open your browser and go to:

   ```
   http://localhost:3000/tasks
   ```

## Features

- Create, Read, Update, and Delete (CRUD) tasks
- Tasks have a title and a completion status
- Styled with Bootstrap for a better UI

## License

This project is open-source under the MIT License.
