class SubdivisionsController < ApplicationController
  def index
    @subdivisions = Subdivision.includes(:people => :sip_user).all

  end
end
