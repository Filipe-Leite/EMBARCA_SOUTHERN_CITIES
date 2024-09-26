class CitiesController < ApplicationController
  def index
    @cities = City.all
    @states = State.all

    @cities = @cities.joins(:state).where('states.acronym = ?', params[:acronym]) if params[:acronym].present?

    if params[:name].present?
      @cities = @cities.where('cities.name ILIKE ?', "%#{params[:name]}%")
    end

    @cities = @cities.distinct
  end

  private

  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name, :acronym)
  end
end
