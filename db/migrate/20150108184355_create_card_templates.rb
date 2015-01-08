class CreateCardTemplates < ActiveRecord::Migration
  def change
    create_table :card_templates do |t|
      t.string :name
      t.string :en
      t.string :path
      t.integer :size_x
      t.integer :size_y
      t.boolean :fullname
      t.boolean :fullname_kana
      t.boolean :department
      t.boolean :course
      t.boolean :laboratory
      t.boolean :email
      t.boolean :tel
      t.boolean :address_code
      t.boolean :address_city
      t.boolean :address_street
      t.boolean :address_building
      t.boolean :twitter
      t.boolean :facebook
      t.boolean :url
      t.boolean :free

      t.timestamps
    end
  end
end
