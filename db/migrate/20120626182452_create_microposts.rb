class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :content
      t.integer :user_id

      t.timestamps  # adds created_at and updated_at cols
    end
    add_index :microposts, [:user_id, :created_at] # mult key on user, time desc
  end
end
