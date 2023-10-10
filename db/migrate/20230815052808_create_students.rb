class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
      t.date :birthday, null: false
      t.text :address, null: false, unique: true
      t.string :phone, null: false

      t.timestamps
    end
  end
end
