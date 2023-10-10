class AddHowmanyToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :howmany, :string
  end
end
