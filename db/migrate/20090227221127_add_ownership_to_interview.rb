class AddOwnershipToInterview < ActiveRecord::Migration
  def self.up
    add_column :interviews, :user_id, :integer
  end

  def self.down
  end
end
