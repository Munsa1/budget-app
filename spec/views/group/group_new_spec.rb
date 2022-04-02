require 'rails_helper'

RSpec.feature 'Group index', type: :feature do
  before(:each) do
    visit user_session_path
    @user = User.create!(name: 'Amy', email: 'amy@mail.com', password: 'password', password_confirmation: 'password')
    within('#new_user') do
      fill_in 'Email', with: 'amy@mail.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    @group = @user.groups.create!(name: 'Travel', icon: 'https://pxhere.com/en/photo/1569711', user_id: @user.id)
    visit new_group_path
  end
  it 'display My Groups on page' do
    expect(page).to have_content('Add your category')
    expect(page).to have_content('Name')
    expect(page).to have_content('Icon')
  end
  it 'display Add New Category button on page' do
    expect(page).to have_button 'Save'
  end

  it 'display back link on page' do
    expect(page).to have_link('back-root')
  end

  it 'When we click on back < , we are redirected to that Group\'s page.' do
    click_link 'back-root'
    expect(page).to have_current_path root_path
  end
end
