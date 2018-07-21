class CreateFights < ActiveRecord::Migration[5.1]
  def change
    create_table :fights do |t|
      t.belongs_to :applicant, null: false, foreign_key: { to_table: :users } 
      t.belongs_to :respondent, null: false, foreign_key: { to_table: :users }
      t.integer :standard, null: false, default: 0
      t.text :content
      t.timestamps
    end
  end
end
