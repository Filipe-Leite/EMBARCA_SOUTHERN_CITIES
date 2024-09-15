require 'rails_helper'

RSpec.describe CitiesController, type: :controller do
  let!(:state1) { State.create!(name: "Paraná", acronym: "PR") }
  let!(:state2) { State.create!(name: "Santa Catarina", acronym: "SC") }
  let!(:city1) { City.create!(name: "Curitiba", state: state1) }
  let!(:city2) { City.create!(name: "Joinville", state: state2) }
  let!(:city3) { City.create!(name: "Blumenau", state: state2) }

  describe "GET #index" do
    context "when searching by state acronym" do
      it "returns cities from that state" do
        get :index, params: { acronym: "SC" }
        expect(assigns(:cities)).to contain_exactly(city2, city3)
      end
    end

    context "when searching by city name" do
      it "returns cities with the matching name" do
        get :index, params: { name: "Curitiba" }
        expect(assigns(:cities)).to contain_exactly(city1)
      end
    end

    context "when searching by partial city name" do
      it "returns cities that match partially with the name" do
        get :index, params: { name: "Join" }
        expect(assigns(:cities)).to contain_exactly(city2)
      end
    end

    context "when no search parameters are provided" do
      it "returns all cities" do
        get :index
        expect(assigns(:cities)).to contain_exactly(city1, city2, city3)
      end
    end
  end
end