# frozen_string_literal: true

require "rails_helper"
require "factory_bot_rails"
require "pry"

RSpec.describe 'Tasks' do
  let!(:user) { create(:user) }

  before do
    login_as user
  end

  it 'Add task as logged user' do
    visit('/')
    click_link 'New task'
    expect(page).to have_selector('.modal', text: 'New item')

    fill_in 'Name', with: 'Name of a task'
    fill_in 'Content', with: 'Task content for user 1'
    click_button 'Save'
    expect(page).to have_content 'Task was successfully created.'

    visit('/')
    expect(page).to have_content 'Task content for user 1'

    # visit('/')
    # click_link 'Kudos'
    # click_link 'Edit this Kudo'
    # fill_in 'Title', with: 'Kudo title 123'
    # click_button 'Update Kudo'

    # expect(page).to have_content 'Kudo was successfully updated.'

    # visit('/')
    # click_link 'Kudos'
    # click_link 'Edit this Kudo'
    # select company_value.title, from: 'kudo_company_value_id'
    # click_button 'Update Kudo'

    # expect(page).to have_content 'Kudo was successfully updated.'

    # visit('/')
    # click_link 'Kudos'
    # click_link 'Destroy this kudo'
    # expect(page).to have_content 'Kudo was successfully destroyed.'

    # # can not see link to delete kudo after 5 minutes

    # visit('/')
    # click_link 'Kudos'
    # expect(page).not_to have_link 'Destroy this kudo'
  end

  it 'displays tasks for the specific user' do
  end
end
