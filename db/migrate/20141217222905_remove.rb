class Remove < ActiveRecord::Migration
  def change
    remove_column :answers, :user, :string
  end
end
