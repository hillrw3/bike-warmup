class Shop < ActiveRecord::Base
  has_many :bikes

  def bike_names
    bikes = []
    Bike.where(shop_id: self.id).each do |bike|
      bikes << bike.name
    end
    bikes
  end

  def buyers
    buyers = []
    bikes = Bike.where(shop_id: self.id)
    bikes.each do |bike|
      Buyer.where(id: bike.buyer_id).each do |buyer|
        buyers << buyer.first_name
      end
    end
    buyers
  end

end