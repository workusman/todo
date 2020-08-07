class CreateTaskChanges < ActiveRecord::Migration[6.0]
  def change
    create_table :task_changes do |t|
      t.references :task, null: false, foreign_key: true
      t.string :change
      t.timestamps
    end
  end
end
