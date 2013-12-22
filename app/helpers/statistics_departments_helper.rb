module StatisticsDepartmentsHelper

  def statistics_select(subdivision)
    arr_number=[]
    subdivision.people.each{|person| arr_number << person.city.number.to_s}
    c = @cdr.where("src LIKE ").first
    c.cdr_pkey
  end

end
