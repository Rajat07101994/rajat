class OrderMailer < ActionMailer::Base
  default from: "no-reply@marketplace.com"
   def send_confirmation(order)
     @order= order
     @user=@order.user
     mail.to :@user.email, subject: "order Confirmation"
   end
end
