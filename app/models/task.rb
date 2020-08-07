class Task < ApplicationRecord
  belongs_to :list
  has_many :task_changes, dependent: :destroy
  after_update :update_history

  scope :complete, -> { where.not( completed_at: nil)}
  scope :incomplete, -> { where( completed_at: nil)}

  def update_history
    task_changes.create(change: completed_at.nil? ? "marked incomplete" : "marked complete" )
  end
end
