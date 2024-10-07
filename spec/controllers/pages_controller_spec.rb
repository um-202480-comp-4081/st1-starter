# frozen_string_literal: true

require 'rails_helper'
require 'rubocop'

RSpec.describe PagesController do
  it 'has no nested method definitions' do
    result = RuboCop::CLI.new.run(['--only', 'Lint/NestedMethodDefinition',
                                   "app/controllers/#{described_class.to_s.underscore}.rb"])
    expect(result).to eq(0), "Rubocop detected nested method definitions in #{described_class}."
  end

  it 'defines required actions' do
    expect(described_class.instance_methods(false)).to match_array %i[home]
  end

  describe 'GET /home' do
    it 'returns a success response' do
      get :home
      expect(response).to be_successful
    end

    it 'renders the home template' do
      get :home
      expect(response).to render_template('home')
    end
  end
end
