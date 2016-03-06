class AddImageToPostings < ActiveRecord::Migration
  def change
    add_column :postings, :image_posting, :string
  end
end
