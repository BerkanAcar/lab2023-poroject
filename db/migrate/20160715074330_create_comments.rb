class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.integer :tweet_id
      t.references :tweet, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
