# frozen_string_literal: true

require 'rails_helper'
require 'rubocop'

RSpec.describe AnimalsController do
  it 'has no nested method definitions' do
    result = RuboCop::CLI.new.run(['--only', 'Lint/NestedMethodDefinition',
                                   "app/controllers/#{described_class.to_s.underscore}.rb"])
    expect(result).to eq(0), "Rubocop detected nested method definitions in #{described_class}."
  end

  it 'defines required actions' do
    expect(described_class.instance_methods(false)).to match_array %i[index]
  end

  describe 'GET /animals' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
end
