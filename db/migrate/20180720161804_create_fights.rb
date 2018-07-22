class CreateFights < ActiveRecord::Migration[5.1]
  def change
    create_table :fights do |t|
      t.belongs_to :applicant, null: false, foreign_key: { to_table: :users } 
      t.belongs_to :respondent, null: false, foreign_key: { to_table: :users }
      t.integer :standard, null: false, default: 0
      t.boolean :respondent_exist, null: false, default: true
      t.text :content
      t.timestamps
      t.text :temp_user
    end
  end
end
