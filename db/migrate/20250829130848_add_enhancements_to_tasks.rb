class AddEnhancementsToTasks < ActiveRecord::Migration[8.0]
  def change
    add_column :tasks, :priority, :integer
    add_column :tasks, :category, :string
    add_column :tasks, :due_date, :datetime
    add_column :tasks, :description, :text
  end
end
