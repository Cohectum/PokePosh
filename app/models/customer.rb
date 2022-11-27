class Customer < ApplicationRecord
  include Pay::Billable
  pay_customer stripe_attributes: :stripe_attributes
  has_many :orders

  def stripe_attributes(pay_customer)
    {
      address: {
        city: pay_customer.address.city,
        province: pay_customer.address.province,
        postal_code: pay_customer.postal_code,
        country: pay_customer.address.country,
        line1: pay_customer.address.line1
      },
      metadata: {
        pay_customer_id: pay_customer.id,
      }
    }
  end

end
