class AddFileAttachmentToMeals < ActiveRecord::Migration
  def change

    remove_column :users, :picture_file_name
    remove_column :users, :picture_content_type
    remove_column :users, :picture_file_size
    remove_column :users, :picture_updated_at

    add_column :meals, :picture_file_name,    :string
    add_column :meals, :picture_content_type, :string
    add_column :meals, :picture_file_size,    :integer
    add_column :meals, :picture_updated_at,   :datetime

  end
end
