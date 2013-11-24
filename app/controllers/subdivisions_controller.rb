class SubdivisionsController < ApplicationController
  def index
    @subdivisions = Subdivision.includes(:functions, people: [:sip_user, :city]).all

  end
end
