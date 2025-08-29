class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
    
    # Search functionality
    if params[:search].present?
      @tasks = @tasks.where("title ILIKE ? OR description ILIKE ?", 
                           "%#{params[:search]}%", "%#{params[:search]}%")
    end
    
    # Filter by category
    if params[:category].present? && params[:category] != 'all'
      @tasks = @tasks.by_category(params[:category])
    end
    
    # Filter by status
    case params[:status]
    when 'completed'
      @tasks = @tasks.completed
    when 'pending'
      @tasks = @tasks.pending
    when 'overdue'
      @tasks = @tasks.overdue
    when 'due_today'
      @tasks = @tasks.due_today
    end
    
    # Sort options
    case params[:sort]
    when 'priority'
      @tasks = @tasks.by_priority
    when 'due_date'
      @tasks = @tasks.by_due_date
    when 'category'
      @tasks = @tasks.order(:category)
    else
      @tasks = @tasks.recent
    end
    
    @task_stats = {
      total: Task.count,
      completed: Task.completed.count,
      pending: Task.pending.count,
      overdue: Task.overdue.count,
      due_today: Task.due_today.count
    }
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: "Task was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: "Task was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy!
    redirect_to tasks_url, notice: "Task was successfully deleted."
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :completed, :priority, :category, :due_date)
  end
end