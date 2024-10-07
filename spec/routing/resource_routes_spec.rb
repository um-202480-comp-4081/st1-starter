# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Routes follow resource naming' do
  context 'when routing' do
    specify 'Pages home' do
      expect(get: home_path).to route_to 'pages#home'
    end

    specify 'Animals index' do
      expect(get: animals_path).to route_to 'animals#index'
    end
  end

  context 'when creating path helpers' do
    specify 'home_path' do
      expect(home_path).to eq '/home'
    end

    specify 'animals_path' do
      expect(animals_path).to eq '/animals'
    end
  end
end
