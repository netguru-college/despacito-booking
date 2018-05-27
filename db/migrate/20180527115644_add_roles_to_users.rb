class AddRolesToUsers < ActiveRecord::Migration[5.2]
  class User < ApplicationRecord
    enum role: { client: 0, admin: 1 }
  end

  def change
    add_column :users, :role, :integer, default: User.roles[:client]
    add_index  :users, :role
  end
end
