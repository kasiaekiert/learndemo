# frozen_string_literal: true

require "rails_helper"
require "factory_bot_rails"
require "pry"

RSpec.describe 'Tasks' do
  let!(:user) { create(:user) }
  let!(:user1) { create(:user) }

  before do
    login_as user
  end

  describe 'User may add task which are visible only for him' do
    it 'Add task as logged user' do
      visit root_path
      click_link 'New task'
      expect(page).to have_selector('.modal', text: 'New item')

      fill_in 'Name', with: 'Name of a task'
      fill_in 'Content', with: 'Task content for user 1'
      click_button 'Save'
      expect(page).to have_content 'Task was successfully created.'
      expect(page).to have_content 'Task content for user 1'
    # end

    # it 'Delete and update task as logged user' do
      visit('/')
      click_link 'Show'
      click_link 'Edit this task'
      fill_in 'Name', with: 'Task title 123'
      click_button 'Save'

      expect(page).to have_content 'Task was successfully updated.'

      visit root_path
      click_link 'Edit'
      fill_in 'Content', with: 'Writing content 1233'
      click_button 'Save'
      expect(page).to have_content 'Task was successfully updated.'
      expect(page).to have_content 'Writing content 1233'

      click_link 'Delete'
      expect(page).to have_content 'Task was successfully destroyed.'
    end
    
    context 'displays tasks for the specific user' do
      before do
        login_as user1
      end

      it 'is visible for specific user' do 
        visit root_path 
        expect(page).not_to have_content 'Task content for user 1'

        logout 
        login_as user

        visit root_path
        expect(page).not_to have_content 'Task content for user 1'
      end
    end
  end
end
