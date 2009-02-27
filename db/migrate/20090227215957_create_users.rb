class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :identity_url, :nullable => false
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
