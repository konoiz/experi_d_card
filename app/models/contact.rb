class Contact
  include ActiveModel::Model
  include ActiveModel::Associations
  
  attr_accessor :name, :department, :subject, :body, :email
  validates :body, presence: true

end
