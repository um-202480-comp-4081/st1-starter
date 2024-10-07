# frozen_string_literal: true

# == Schema Information
#
# Table name: animals
#
#  id         :bigint           not null, primary key
#  location   :string
#  name       :string
#  species    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Animal do
  it 'has seeds' do
    load Rails.root.join('db/seeds.rb').to_s

    expect(described_class.count).to eq 5
    expect(described_class.order(:name).pluck(:name, :species, :location))
      .to eq [['Danger Noodle', 'Snake', 'Herpetarium'],
              ['Luthor', 'Lion', 'Cat Country'],
              ['Maggie', 'Gorilla', 'Primate Canyon'],
              ['Pancake', 'Stingray', 'Aquarium'],
              ['Stampy', 'Elephant', 'African Veldt']]
  end
end
