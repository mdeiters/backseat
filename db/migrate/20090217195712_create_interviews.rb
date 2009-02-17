class CreateInterviews < ActiveRecord::Migration
  def self.up
    create_table :interviews do |t|
      t.string :question
      t.text   :description
      t.timestamps
    end
  end

  def self.down
    drop_table :interviews
  end
end
