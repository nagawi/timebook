class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.string :name
      t.text :note
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
