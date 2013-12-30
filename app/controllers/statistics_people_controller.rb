class StatisticsPeopleController < ApplicationController
  def index
    @people = Person.includes(:sip_user, :city).all

    @cdr = Cdr.all

    @time1 = Time.now-1.months
    @time2 = Time.now

    if (params[:date1] && params[:date2])
      @time1 = Time.new(params[:date1][:year], params[:date1][:month], params[:date1][:day], 0, 0, 0, "+00:00")
      @time2 = Time.new(params[:date2][:year], params[:date2][:month], params[:date2][:day],23,59,59, "+00:00")
      @cdr = @cdr.where(calldate: @time1..@time2)
    end

    @cdr
  end
end
