class RenameColumnNameInBlogs < ActiveRecord::Migration
  def self.up
    rename_column :blogs, :name, :title
  end

  def self.down
    rename_column :blogs, :title, :name
  end
end
