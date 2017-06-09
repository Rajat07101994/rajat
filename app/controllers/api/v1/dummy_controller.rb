class Api::V1::DummyController < ApplicationController
  responds_to :json
  def show
    responds_with User.find(params[:id])
  end
end
