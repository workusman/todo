class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :name, default: "My List"
      t.references :user

      t.timestamps
    end
  end
end
