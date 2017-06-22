class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_with_token!
  byebug
  respond_to :json

  def index
    byebug
    #respond_with current_user.orders
    orders = current_user.orders.page(params[:page]).per(params[:per_page])
    render json: orders, meta: pagination(orders, params[:per_page])
  end

  def show
    byebug
    respond_with current_user.orders.find(params[:id])
  end

  def create
    byebug
      order = current_user.orders.build
      byebug
      order.build_placements_with_product_ids_and_quantities(params[:order][:product_ids_and_quantities])
      byebug
      if order.save
        order.reload #we reload the object so the response displays the product objects
         OrderMailer.delay.send_confirmation(order)
        render json: order, status: 201, location: [:api, current_user, order]
      else
        render json: { errors: order.errors }, status: 422
      end
    end

  private

    def order_params
      params.require(:order).permit(:product_ids => [])
    end
end
