class OrderMailer < ApplicationMailer
  
  default from: "no-reply@jungle.com"

  def order_confirm_email(order)
    @order = order
    mail(to: "@order.email", subject: 'Thanks for your order at Jungle.com')
  end

  end
