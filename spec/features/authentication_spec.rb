feature 'Authentication' do
  scenario 'a user can sign in' do
    User.create(email: 'facts@example.com', password: 'password123')
    visit '/sessions/new'
    fill_in('email', with: 'facts@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign in')
    expect(page).to have_content 'Welcome, facts@example.com'
  end
end