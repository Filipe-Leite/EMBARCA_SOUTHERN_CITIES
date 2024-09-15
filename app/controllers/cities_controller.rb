class CitiesController < ApplicationController

  def index
    @cities = City.all
    @states = State.all

    if params[:acronym].present?
      @cities = @cities.joins(:state).where('states.acronym = ?', params[:acronym])
    end

    if params[:name].present?
      @cities = @cities.where('cities.name ILIKE ?', "%#{params[:name]}%")
    end

  end

  private
    def set_city
      @city = City.find(params[:id])
    end

    def city_params
      params.require(:city).permit(:name, :acronym)
    end
end
