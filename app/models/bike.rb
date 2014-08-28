class Bike < ActiveRecord::Base
  belongs_to :buyer
  belongs_to :shop

  def favorited_by
    first = Buyer.find_by(favorite_brand: self.brand).first_name
    last = Buyer.find_by(favorite_brand: self.brand).last_name
    "#{first} #{last}"
  end
end