module Admin::CustomersHelper
  def customer_status_name(customer)
    if customer.is_deleted
      '退会'
    else
      '有効'
    end
  end
end
