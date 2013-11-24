class PeopleController < ApplicationController
  def edit
    @person = Person.includes(:positions).find(params[:id])
  end

  def show
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to subdivisions_path, notice: 'Sip пользователь создан.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
   # render text: params
    @person = Person.includes(:positions).find(params[:id])
      respond_to do |format|
        if @person.update(person_params)
          format.html { redirect_to subdivisions_path, notice: 'Sip сохранен.' }
        else
          format.html { render action: 'edit' }
        end
      end
  end

  private
  def person_params
    params.require(:person).permit(:surname, :firstname, :patronymic, positions_attributes: [:id, :person_id, :function_id, :subdivision_id, :_destroy])
  end
end
