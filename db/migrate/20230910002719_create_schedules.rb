class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.integer :class_time, null: false
      t.integer :course_id, null: false
      t.integer :instructor_id, null: false 
      t.date :class_day, null: false


      t.timestamps
    end
  end
end
