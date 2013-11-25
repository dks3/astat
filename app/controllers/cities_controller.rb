class CitiesController < ApplicationController

  def index
    respond_to do |format|
      format.json do
        q="%#{params[:q]}%"
        render json: City.where("lower(number) like ?", q).all.to_json(only: [:number, :id])
      end
    end
  end
end
