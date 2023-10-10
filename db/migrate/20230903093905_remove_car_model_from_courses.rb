class RemoveCarModelFromCourses < ActiveRecord::Migration[6.1]
  def change
    remove_column :courses, :car_model, :string
  end
end
