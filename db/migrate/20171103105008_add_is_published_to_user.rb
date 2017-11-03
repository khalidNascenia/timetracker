class AddIsPublishedToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_published, :boolean, default: false
    add_column :users, :resignation_date, :date
  end
end