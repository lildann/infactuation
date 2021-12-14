feature 'Sign in' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'facts@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign in')
    expect(page).to have_content "Welcome, facts@example.com"  
  end
end