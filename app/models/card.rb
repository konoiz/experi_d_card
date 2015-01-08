class Card
  include ActiveModel::Model
  include ActiveModel::Associations
  
  belongs_to :department
  belongs_to :school

  attr_accessor :name, :kana_name, :department, :postalcode, :address_prefectural, :address_city, :address_street, :address_building, :tel, :email, :course, :laboratory, :free_text, :paper_template, :card_template

  validates :name,  presence: true
end
