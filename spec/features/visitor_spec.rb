# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Visitor Features' do
  feature 'Learn About the Memphis Zoo' do
    scenario "Viewing the zoo's information page" do
      visit home_path

      aggregate_failures do
        expect(page).to have_css('h1', exact_text: 'The Memphis Zoo')
        within('p') do
          expect(page).to have_content('Meet Our Animals:')
          expect(page).to have_link('Zoo Directory')
        end
        expect(page).to have_css('img')
      end
    end

    scenario 'Redirecting from the root page to the home page' do
      visit root_path

      expect(page).to have_current_path(home_path, ignore_query: true)
    end
  end

  feature 'Browse Animals' do
    let!(:animal_one) do
      create(:animal, name: 'Sparky', species: 'Two-toed Sloth', location: 'Animals of the Night')
    end
    let!(:animal_two) do
      create(:animal, name: 'Tera', species: 'Caracal', location: 'Cat Country')
    end

    scenario 'Viewing the track index page content' do
      visit animals_path

      aggregate_failures do
        expect(page).to have_css('h1', text: 'Zoo Directory')
        within('table') do
          within('thead') do
            within('tr') do
              expect(page).to have_css('th', exact_text: 'Name')
              expect(page).to have_css('th', exact_text: 'Species')
              expect(page).to have_css('th', exact_text: 'Location')
            end
          end
          within('tbody') do
            within('tr:nth-child(1)') do
              expect(page).to have_css('td', exact_text: animal_one.name)
              expect(page).to have_css('td', exact_text: animal_one.species)
              expect(page).to have_css('td', exact_text: animal_one.location)
            end

            within('tr:nth-child(2)') do
              expect(page).to have_css('td', exact_text: animal_two.name)
              expect(page).to have_css('td', exact_text: animal_two.species)
              expect(page).to have_css('td', exact_text: animal_two.location)
            end
          end
        end
        within('p') do
          expect(page).to have_link('Home')
        end
      end
    end

    scenario 'Navigating to the animal index page from the home page' do
      visit home_path

      click_on 'Zoo Directory'

      expect(page).to have_current_path(animals_path, ignore_query: true)
    end

    scenario 'Navigating back to the home page from the animal index page' do
      visit animals_path

      click_on 'Home'

      expect(page).to have_current_path(home_path, ignore_query: true)
    end
  end
end
