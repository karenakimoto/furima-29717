class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :city, :address, :building, :phonenumber, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefectures_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phonenumber, format: { with: /\A\d{11}\z/ }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, address: address, building: building, phonenumber: phonenumber, order_id: order.id)
  end
end
