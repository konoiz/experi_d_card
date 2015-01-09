class Resume
  include ActiveModel::Model
  include ActiveModel::Associations
  
  belongs_to :department
  belongs_to :school

  attr_accessor :name, :name_kana, :sex, :birth_year, :birth_month, :birth_day, :address, :address_kana, :address_postcode, :tel_mobile, :tel_home, :email, :holiday_address, :holiday_address_kana, :holiday_address_postcode, :holiday_tel_mobile, :holiday_tel_home, :history_era, :history_year, :history_month, :history_body, :work_theme, :work_tutor, :work_detail, :interest, :license, :pr, :purpose

  validates :name,  presence: true
end
