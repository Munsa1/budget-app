require 'rails_helper'

RSpec.feature 'Group index', type: :feature do
  before(:each) do
    visit new_user_session_path

    @user = User.create(name: 'Amy', email: 'amy@mail.com', password: 'password')
    @group = Group.create(name: 'Travel', icon: 'https://pxhere.com/en/photo/1569711', user_id: @user.id)
    @expense = Expense.create(name: 'Paris', amount: 1000.0, user_id: @user.id, group_id: @group.id)
    fill_in 'Email', with: 'amy@mail.com'
    fill_in 'Password', with: 'password'

    click_button 'Log in'
    visit new_group_expense_path(@group.id)
  end
  it 'display My Expense on the page' do
    expect(page).to have_content('Add your expenses')
    expect(page).to have_content('Name')
    expect(page).to have_content('Amount')
  end
  it 'display Add New expense button on page' do
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
