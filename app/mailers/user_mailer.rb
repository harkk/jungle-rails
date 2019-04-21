class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_email(order)
    @order = order
    @url = "http://localhost:3000/orders/#{order.id}"
    mail(to: 'khabra@gmail.com', subject: 'Thank you for your order at Jungle.com')
  end
  
end
