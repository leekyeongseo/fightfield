class CreateTemplateDevelopments < ActiveRecord::Migration[5.1]
  def change
    create_table :template_developments do |t|

      t.timestamps
    end
  end
end
