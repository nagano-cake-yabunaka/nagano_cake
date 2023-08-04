class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum status:{
    impossible_making:0,
    waiting_making:1,
    making:2,
    finish:3
  }

  def subtotal
    price * amount
  end
end
