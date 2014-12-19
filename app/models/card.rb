class Card
  include ActiveModel::Model
  include ActiveModel::Associations
  
  belongs_to :department
  belongs_to :school

  attr_accessor :first_name, :last_name, :kana_first_name, :kana_last_name, :department, :postalcode, :address_prefectural, :address_city, :address_street, :address_building, :tel, :email, :course, :laboratory, :free_text

  validates :first_name,  presence: true
  validates :last_name,   presence: true
end
