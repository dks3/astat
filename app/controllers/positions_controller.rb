class PositionsController < ApplicationController

  def create
    @position = Position.find(params[:id])
    @position = Position.update_attributes(params[:position])
  end

  def destroy
    @position = Position.find(params[:id])
    person = @position.person
    @position.destroy
    redirect_to person_path(person), notice: "Позиция удалена"
  end
end
