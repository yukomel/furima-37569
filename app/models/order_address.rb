class OrderAddress
  include ActiveModel::Model
  attr_accessor :code, :prefecture_id, :city, :address, :building, :phone, :order_id, :user_id, :product_id, :token
  with_options presence: true do
    validates :code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :city
    validates :address
    validates :phone, format: {with: /\A\d{10,11}\z/}
    validates :user_id
    validates :product_id
    validates :token
  end

  def save
    order = Order.create(product_id: product_id, user_id: user_id)
    Address.create(
      code: code, 
      prefecture_id: prefecture_id,
      city: city, 
      address: address, 
      building: building,
      phone: phone,
      order_id: order.id)
   end
   
end
