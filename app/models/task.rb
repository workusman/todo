class Task < ApplicationRecord
  belongs_to :list
  has_many :task_changes, dependent: :destroy
  after_update :update_history

  def update_history
    task_changes.create(change: completed_at.nil? ? "marked incomplete" : "marked complete" )
  end
end
