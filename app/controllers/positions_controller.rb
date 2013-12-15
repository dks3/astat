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
    @position=Position.find(params[:position])
    @position.update(subdivision_id: params[:subdivision_id])

    render nothing: true
  end

 # def destroy
 #   @position = Position.find(params[:id])
 #   person = @position.person
  #  @position.destroy
  #  redirect_to person_path(person), notice: "Позиция удалена"
  #end
private
  #def position_params
  #  params.require(:position).permit(:id, :subdivision_id)
  #end
end
