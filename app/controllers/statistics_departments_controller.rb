class StatisticsDepartmentsController < ApplicationController

  helper_method :sort_column, :sort_direction

  def index
    @people = Person.includes(:subdivisions)
    ##render text: params[:date1][day].nil?
    #@cdr = Cdr.all

    @time1 = Time.now-1.months
    @time2 = Time.now

    if (params[:date1] && params[:date2])
      @time1 = Time.new(params[:date1][:year], params[:date1][:month], params[:date1][:day], 0, 0, 0, "+00:00")
      @time2 = Time.new(params[:date2][:year], params[:date2][:month], params[:date2][:day],23,59,59, "+00:00")
    end

    if (params[:time1] && params[:time2])
      @time1 = Time.new(params[:time1][0,4], params[:time1][5,2], params[:time1][8,2])
      @time2 = Time.new(params[:time2][0,4], params[:time2][5,2], params[:time2][8,2])
    end

    #@cdr

  #  @sort_p = :calldate
   # @sort_p = params[:sort] if (params[:sort])
   # @direction = :asc
  #  @direction = params[:direction] if (params[:direction])
   # puts '-------------------------------'
   # puts @time2
    @cdrs = Cdr.find_by_sql("(SELECT DISTINCT * FROM
(SELECT a.cdr_pkey, a.calldate, a.clid, a.src, a.dst, a.dcontext, a.billsec, a.disposition, b.id as id_num, b.number as num, c.city_id, c.id as person_id, c.surname, c.firstname, c.patronymic
FROM cdr a JOIN cities b ON a.src ~ b.number
JOIN people c ON b.id = c.city_id
UNION ALL
SELECT a.cdr_pkey, a.calldate, a.clid, a.src, a.dst, a.dcontext, a.billsec, a.disposition, b.id as id_num, b.name as num, c.city_id, c.id as person_id, c.surname, c.firstname, c.patronymic
FROM cdr a JOIN sip_users b ON a.src ~ b.name
JOIN people c ON b.id = c.city_id
UNION ALL
SELECT a.cdr_pkey, a.calldate, a.clid, a.src, a.dst, a.dcontext, a.billsec, a.disposition, b.id as id_num, b.number as num, c.city_id, c.id as person_id, c.surname, c.firstname, c.patronymic
FROM cdr a JOIN cities b ON a.dst ~ b.number
JOIN people c ON b.id = c.city_id
UNION ALL
SELECT a.cdr_pkey, a.calldate, a.clid, a.src, a.dst, a.dcontext, a.billsec, a.disposition, b.id as id_num, b.name as num, c.city_id, c.id as person_id, c.surname, c.firstname, c.patronymic
FROM cdr a JOIN sip_users b ON a.dst ~ b.name
JOIN people c ON b.id = c.city_id) AS #{''"statistic"''}
WHERE statistic.calldate BETWEEN '#{@time1}' AND '#{@time2}'
ORDER BY statistic.#{sort_column} #{sort_direction}
)")
   #@cdrs = @cdrs.order(params[:sort])
  end

  def show
    @subdivision = Subdivision.includes(people:[:city, :sip_user]).find(params[:id])
    people=@subdivision.people.all.map{|p| p.id}.compact
    people = people.to_s[1...-1]

    @time1 = Time.now-1.months
    @time2 = Time.now

    if (params[:date1] && params[:date2])
      @time1 = Time.new(params[:date1][:year], params[:date1][:month], params[:date1][:day], 0, 0, 0, "+00:00")
      @time2 = Time.new(params[:date2][:year], params[:date2][:month], params[:date2][:day],23,59,59, "+00:00")
    end

    if (params[:time1] && params[:time2])
      @time1 = Time.new(params[:time1][0,4], params[:time1][5,2], params[:time1][8,2])
      @time2 = Time.new(params[:time2][0,4], params[:time2][5,2], params[:time2][8,2])
    end


   # @sort_p = :calldate
   # @sort_p = params[:sort] if (params[:sort])
   # @direction = :asc
   # @direction = params[:direction] if (params[:direction])
    @cdrs = Cdr.find_by_sql("(SELECT DISTINCT * FROM
(SELECT a.cdr_pkey, a.calldate, a.clid, a.src, a.dst, a.dcontext, a.billsec, a.disposition, b.id as id_num, b.number as num, c.city_id, c.id as person_id, c.surname, c.firstname, c.patronymic
FROM cdr a JOIN cities b ON a.src ~ b.number
JOIN people c ON b.id = c.city_id
UNION ALL
SELECT a.cdr_pkey, a.calldate, a.clid, a.src, a.dst, a.dcontext, a.billsec, a.disposition, b.id as id_num, b.name as num, c.city_id, c.id as person_id, c.surname, c.firstname, c.patronymic
FROM cdr a JOIN sip_users b ON a.src ~ b.name
JOIN people c ON b.id = c.city_id
UNION ALL
SELECT a.cdr_pkey, a.calldate, a.clid, a.src, a.dst, a.dcontext, a.billsec, a.disposition, b.id as id_num, b.number as num, c.city_id, c.id as person_id, c.surname, c.firstname, c.patronymic
FROM cdr a JOIN cities b ON a.dst ~ b.number
JOIN people c ON b.id = c.city_id
UNION ALL
SELECT a.cdr_pkey, a.calldate, a.clid, a.src, a.dst, a.dcontext, a.billsec, a.disposition, b.id as id_num, b.name as num, c.city_id, c.id as person_id, c.surname, c.firstname, c.patronymic
FROM cdr a JOIN sip_users b ON a.dst ~ b.name
JOIN people c ON b.id = c.city_id) AS #{''"statistic"''}
WHERE (statistic.calldate BETWEEN '#{@time1}' AND '#{@time2}')  AND (statistic.person_id IN (#{people}))
ORDER BY statistic.#{sort_column} #{sort_direction}
)")



  end

  private

  def sort_column
    %w[calldate surname clid src dst billsec disposition dcontext].include?(params[:sort]) ? params[:sort] : "calldate"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
