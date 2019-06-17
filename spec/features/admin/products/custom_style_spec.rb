# encoding: utf-8

require 'spec_helper'

describe 'Custom Styles', type: :feature, js: true do
  stub_authorization!

  let!(:master_product) { create(:master_product) }
  let(:file_path) { Rails.root + '../../spec/support/ror_ringer.jpeg' }

  context 'creating a new custom style' do
    it 'should allow an admin to create a new custom style', js: true do
      visit spree.admin_products_path

      within_row(1) { click_icon :edit }
      click_link 'Custom Styles'
      click_on 'New Custom Style'

      fill_in 'custom_style_name', with: 'Rails Shirt'
      fill_in 'custom_style_slug', with: 'rails-shirt'
      attach_file('Filename', file_path)

      click_button 'Create'

      expect(page).to have_content('successfully created!')
      within('tbody') do
        expect(page).to have_content('Rails Shirt')
      end
    end
  end

  context 'editing and deleting an existing custom style' do
    it 'should allow an admin to update an existing style' do
      create(:custom_style, master_product: master_product, name: 'Yellow Shirt', slug: 'yellow-shirt')
      visit spree.admin_products_path

      within_row(1) { click_icon :edit }
      click_link 'Custom Styles'
      click_link 'Yellow Shirt'

      fill_in 'custom_style_name', with: 'Beige Shirt'
      fill_in 'custom_style_slug', with: 'beige-shirt'
      click_button 'Update'
      expect(page).to have_content('successfully updated!')
      expect(page).to have_content('Beige Shirt')

      within_row(1) { click_link :delete }
      expect(page).to have_content('Style has been deleted')
    end
  end
end
