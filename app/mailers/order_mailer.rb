class OrderMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def order_confirmation
      @customer = params[:customer]

      mail(to: @customer.email, subject: 'Order Confirmation')
    end
  end
  