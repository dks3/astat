class SubdivisionsController < ApplicationController
  def index
    @subdivisions = Subdivision.includes(:ordered_positions, people: [:sip_user, :city]).all   
  end

end
