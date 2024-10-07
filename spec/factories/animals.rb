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
FactoryBot.define do
  factory :animal do
    name { 'Akila' }
    species { 'Wolf' }
    location { 'Den' }
  end
end
