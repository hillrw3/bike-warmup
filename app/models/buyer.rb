class Buyer < ActiveRecord::Base
  has_many :bikes

  def shops_without_favorite
    shops = []
    favorite_bike = Bike.find_by(brand: self.favorite_brand)
    Shop.where.not(id: favorite_bike.shop_id).each do |shop|
      shops << shop.name
    end
    shops
  end
end