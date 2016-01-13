class OrderNotifier < ApplicationMailer
  default from: 'Reinis Šlosbergs <depot@example.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.recieved.subject
  #
  def received(order)
    @order = order

    mail to: order.email, subject: 'Furniture Store Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
    @order = order

    mail to: order.email, subject: 'Furniture Store Order Shipped'
  end
end
