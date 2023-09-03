class AddCarModelToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :car_model, :integer
  end
end
