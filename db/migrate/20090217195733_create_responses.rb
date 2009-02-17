class CreateResponses < ActiveRecord::Migration
  def self.up
    create_table :responses do |t|
      t.integer :interview_id
      t.string  :user, :value
      t.text    :comment
      t.timestamps
    end
  end

  def self.down
    drop_table :responses
  end
end
