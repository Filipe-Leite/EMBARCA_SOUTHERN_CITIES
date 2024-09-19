require 'rails_helper'

RSpec.describe CitiesController, type: :routing do
  it 'routes to #index' do
    expect(get: '/cities').to route_to('cities#index')
  end
end
