class PositionsController < ApplicationController

  def create
    @position = Position.find(params[:id])
    @position = Position.update_attributes(params[:position])
  end

  def destroy
    @position = Position.find(params[:id])
    person = @position.person
    @position.destroy
    person.destroy if person.positions.empty?
    redirect_to subdivisions_path, notice: "Позиция удалена"

  end

  def sort
    params[:position].each_with_index do |id, i|
      Position.update_all({subdivision_id: i}, {id: id})
    end
    render nothing: true
  end

 # def destroy
 #   @position = Position.find(params[:id])
 #   person = @position.person
  #  @position.destroy
  #  redirect_to person_path(person), notice: "Позиция удалена"
  #end
end
