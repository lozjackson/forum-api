class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :body, :limit => 4294967295
      t.references :topic
      t.references :user

      t.timestamps
    end
  end
end
