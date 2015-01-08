class CreatePaperTemplates < ActiveRecord::Migration
  def change
    create_table :paper_templates do |t|
      t.string :name
      t.string :en
      t.string :path
      t.integer :cols
      t.integer :rows
      t.integer :margin_x
      t.integer :margin_y
      t.integer :gap_x
      t.integer :gap_y

      t.timestamps
    end
  end
end
