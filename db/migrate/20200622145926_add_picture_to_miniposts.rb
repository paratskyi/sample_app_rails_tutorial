class AddPictureToMiniposts < ActiveRecord::Migration[6.0]
  def change
    add_column :miniposts, :picture, :string
  end
end
