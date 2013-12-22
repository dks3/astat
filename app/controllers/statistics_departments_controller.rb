class StatisticsDepartmentsController < ApplicationController

  def index
    @subdivisions = Subdivision.includes(people: [:sip_user, :city]).all
    @cdr = Cdr.all

  end

end
