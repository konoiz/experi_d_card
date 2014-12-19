class CreateLaboratories < ActiveRecord::Migration
  def change
    create_table :laboratories do |t|
      t.references :department, index: true
      t.string :name
      t.string :teacher

      #t.timestamps
    end
  end
end
