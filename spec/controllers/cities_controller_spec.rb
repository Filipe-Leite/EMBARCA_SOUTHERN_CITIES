require 'rails_helper'

RSpec.describe CitiesController, type: :controller do
  let(:parana) { State.create!(name: 'Paraná', acronym: 'PR') }
  let(:santa_catarina) { State.create!(name: 'Santa Catarina', acronym: 'SC') }
  let(:curitiba) { City.create!(name: 'Curitiba', state: parana) }
  let(:curitibanos) { City.create!(name: 'Curitiba', state: santa_catarina) }
  let(:joinville) { City.create!(name: 'Joinville', state: santa_catarina) }
  let(:blumenau) { City.create!(name: 'Blumenau', state: santa_catarina) }

  describe 'GET #index' do
    context 'when searching by state acronym' do
      it 'returns cities from that state' do
        get :index, params: { acronym: 'SC' }
        expect(assigns(:cities)).to include(joinville, blumenau)
      end
    end

    context 'when searching by city name' do
      it 'returns cities with the matching name' do
        get :index, params: { name: 'Curitiba' }
        expect(assigns(:cities)).to include(curitiba, curitibanos)
      end
    end

    context 'when searching by partial city name' do
      it 'returns cities that match partially with the name' do
        get :index, params: { name: 'join' }
        expect(assigns(:cities).map(&:name)).to include("Joinville")
        expect(assigns(:cities).map(&:name).uniq.size).to eq(assigns(:cities).size)
      end      
    end

    context 'when no search parameters are provided' do
      it 'returns all cities' do
        get :index
        expect(assigns(:cities)).to match_array(City.all)
      end
    end
  end
end
