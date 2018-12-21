class AddAdresToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :adres, :string
  end
end
