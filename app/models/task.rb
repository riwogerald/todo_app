class Task < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1, maximum: 255 }
  validates :priority, presence: true, inclusion: { in: 1..5 }
  validates :category, presence: true
  
  scope :completed, -> { where(completed: true) }
  scope :pending, -> { where(completed: false) }
  scope :recent, -> { order(created_at: :desc) }
  scope :by_priority, -> { order(priority: :asc) }
  scope :by_due_date, -> { order(due_date: :asc) }
  scope :overdue, -> { where('due_date < ? AND completed = ?', Date.current, false) }
  scope :due_today, -> { where(due_date: Date.current..Date.current.end_of_day) }
  scope :due_this_week, -> { where(due_date: Date.current.beginning_of_week..Date.current.end_of_week) }
  scope :by_category, ->(category) { where(category: category) }
  
  CATEGORIES = [
    'Work', 'Personal', 'Health', 'Finance', 'Education', 
    'Family', 'Travel', 'Shopping', 'Projects', 'Other'
  ].freeze
  
  PRIORITY_LABELS = {
    1 => { label: 'Critical', color: 'danger', icon: 'exclamation-triangle-fill' },
    2 => { label: 'High', color: 'warning', icon: 'exclamation-circle-fill' },
    3 => { label: 'Medium', color: 'info', icon: 'info-circle-fill' },
    4 => { label: 'Low', color: 'secondary', icon: 'dash-circle' },
    5 => { label: 'Minimal', color: 'light', icon: 'circle' }
  }.freeze
  
  def status
    completed? ? 'Completed' : 'Pending'
  end
  
  def completed_at_display
    return nil unless completed?
    updated_at.strftime("%B %d, %Y")
  end
  
  def priority_label
    PRIORITY_LABELS[priority][:label]
  end
  
  def priority_color
    PRIORITY_LABELS[priority][:color]
  end
  
  def priority_icon
    PRIORITY_LABELS[priority][:icon]
  end
  
  def overdue?
    due_date.present? && due_date < Date.current && !completed?
  end
  
  def due_today?
    due_date.present? && due_date.to_date == Date.current
  end
  
  def due_soon?
    due_date.present? && due_date <= 3.days.from_now && !completed?
  end
  
  def formatted_due_date
    return 'No due date' unless due_date.present?
    
    if due_date.to_date == Date.current
      'Due today'
    elsif due_date.to_date == Date.tomorrow
      'Due tomorrow'
    elsif due_date.to_date < Date.current
      "#{time_ago_in_words(due_date)} overdue"
    else
      due_date.strftime('%b %d, %Y')
    end
  end
  
  def progress_percentage
    return 100 if completed?
    return 0 unless due_date.present?
    
    total_time = due_date - created_at
    elapsed_time = Time.current - created_at
    
    return 0 if total_time <= 0
    [(elapsed_time / total_time * 100).round, 100].min
  end
  
  private
  
  def time_ago_in_words(time)
    distance_in_days = (Date.current - time.to_date).to_i
    
    case distance_in_days
    when 0
      'today'
    when 1
      '1 day ago'
    else
      "#{distance_in_days} days ago"
    end
  end
end
