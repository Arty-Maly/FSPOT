class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :comments, index: true
      t.references :likes, index: true
      t.references :relationships, index: true
      t.references :uploads, index: true
      t.references :user, index: true
      t.boolean :read

      t.timestamps
    end
  end
end
