class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.references :school, index: true
      t.string :name
      t.string :en
      t.string :short

      #t.timestamps
    end
  end
end
