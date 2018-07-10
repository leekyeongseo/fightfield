class CreateTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :templates do |t|
      t.string :title
      t.text :desc
      t.belongs_to :user

      t.timestamps
    end
  end
end
