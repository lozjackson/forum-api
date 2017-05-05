class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :title
      t.text :body, :limit => 4294967295
      t.references :user

      t.timestamps
    end
  end
end
