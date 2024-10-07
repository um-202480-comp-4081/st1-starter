# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pages/home.html.erb' do
  before do
    allow(view).to receive(:link_to).and_call_original
    allow(view).to receive(:animals_path).and_call_original

    render
  end

  it 'uses link_to helper for links' do
    expect(view).to have_received(:link_to).exactly(1).times
  end

  it 'uses appropriate route helper(s)' do
    expect(view).to have_received(:animals_path).exactly(1).times
  end

  it 'has properly closed HTML tags' do
    %w[h1 h2 h3 h4 h5 h6 p a div span ul ol li b i strong table thead tbody tr th td].each do |tag|
      expect(rendered.scan(/<#{tag}[ >]/).size).to eq(rendered.scan("</#{tag}>").size), -> { "check #{tag} tags" }
    end
  end

  it 'does not duplicate elements from layout' do
    %w[head style body].each do |el|
      expect(rendered.scan(/<#{el}[ >]/).size).to eq(0)
    end
  end

  it 'has only the required elements' do
    expect(Nokogiri::HTML.parse(rendered).search('*').map(&:name)).to eq %w[html body h1 p a img]
    expect(Nokogiri::HTML.parse(rendered).text.gsub(
             /\s+/, ''
           )).to eq 'TheMemphisZooMeetOurAnimals:ZooDirectory'
  end
end
