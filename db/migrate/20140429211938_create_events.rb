class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.integer :guest_count
      t.integer :min_budget
      t.integer :max_budget
      t.string :location
      t.text :details
      t.string :planner

      t.timestamps
    end
  end
end
