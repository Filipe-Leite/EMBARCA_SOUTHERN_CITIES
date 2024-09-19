require 'net/http'
require 'json'

State.create(name: 'Paraná', acronym: 'pr')
State.create(name: 'Santa Catarina', acronym: 'sc')
State.create(name: 'Rio Grande do Sul', acronym: 'rs')

def seed_cities
  states = State.all

  states.each do |state|
    ibge_api_service = IbgeGov.new

    response = ibge_api_service.get_cities_by_uf(state.acronym)

    next unless response.is_a?(Net::HTTPSuccess)

    @cities_response = JSON.parse(response.body)

    @cities_response.each do |city|
      City.create(name: city['nome'], state_id: state.id)
    end
  end
end

seed_cities
