class CreateHaves < ActiveRecord::Migration
  def change
    create_table :haves do |t|
      t.string :course_number
      t.string :course_name
      t.integer :course_section
      t.integer :trade_id

      t.timestamps
    end
  end
end
