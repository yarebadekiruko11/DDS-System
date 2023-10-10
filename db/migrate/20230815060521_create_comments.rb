class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :instructor_id
      t.integer :course_id
      t.text :comment_body

      t.timestamps
    end
  end
end
