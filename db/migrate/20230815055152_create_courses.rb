class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.integer :student_id
      t.integer :instructor_id
      t.datetime :start_time
      t.string :car_model
      t.integer :status, default: 0, null: false, limit: 3
      t.date :graduation_day

      t.timestamps
    end
  end
end
