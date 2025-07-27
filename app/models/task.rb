class Task < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1, maximum: 255 }
  
  scope :completed, -> { where(completed: true) }
  scope :pending, -> { where(completed: false) }
  scope :recent, -> { order(created_at: :desc) }
  
  def status
    completed? ? 'Completed' : 'Pending'
  end
  
  def completed_at_display
    return nil unless completed?
    updated_at.strftime("%B %d, %Y")
  end
end