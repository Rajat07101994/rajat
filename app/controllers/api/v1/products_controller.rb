class Api::V1::ProductsController < ApplicationController
  respond_to :json
    def show
      respond_with product.find(:params[:id])
     end
  def index
      respond_with Product.all
    end
end
