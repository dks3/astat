class SubdivisionsController < ApplicationController
  def index
<<<<<<< HEAD
    @subdivisions = Subdivision.includes(:functions, people: [:sip_user, :city]).all
=======
    @subdivisions = Subdivision.includes(:people => :sip_user).all
>>>>>>> cbfd00219ef1cb36cedf1218f6d4c45963597e33

  end
end
