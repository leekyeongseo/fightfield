class CreateFeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :feeds do |t|
      t.string :to
      t.string :from
      t.integer :fight_type
      t.text :content

      t.timestamps
    end
  end
end
