class AddZipcodeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :zipcode, :integer
  end
end
