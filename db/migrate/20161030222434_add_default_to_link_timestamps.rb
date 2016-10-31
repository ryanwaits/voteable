class AddDefaultToLinkTimestamps < ActiveRecord::Migration[5.0]
  def change
    change_column_default :links, :created_at, DateTime.now
    change_column_default :links, :updated_at, DateTime.now
  end
end
