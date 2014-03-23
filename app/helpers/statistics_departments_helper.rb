module StatisticsDepartmentsHelper
  def departments(person_id)
    @people.where(id: person_id).first


  end
end
