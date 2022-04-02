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
    visit groups_path
  end

  it 'expect page path to be the group path' do
    expect(page).to have_current_path groups_path
  end

  it 'show Categories heading' do
    expect(page).to have_content 'Categories'
  end

  it 'display Add New Category button on page' do
    expect(page).to have_link 'Add category'
  end

  it 'When I click on group name, I am redirected to the entity of that specific group.' do
    click_link 'Travel'
    expect(page).to have_current_path group_expenses_path(@group.id)
  end

  it 'When I click on Add category, I am redirected to that Group\'s new page.' do
    click_link('Add category')
    expect(page).to have_current_path new_group_path
  end
end
