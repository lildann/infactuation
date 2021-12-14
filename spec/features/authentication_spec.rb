feature 'Authentication' do
  scenario 'a user can sign in' do
    User.create(email: 'facts@example.com', password: 'password123')
    visit '/sessions/new'
    fill_in('email', with: 'facts@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign in')
    expect(page).to have_content 'Welcome, facts@example.com'
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(email: 'facts@example.com', password: 'password123')
    visit '/sessions/new'
    fill_in(:email, with: 'nottherightemail@test.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, facts@example.com'
    expect(page).to have_content "Please check your email or password\n"
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create(email: 'facts@example.com', password: 'password123')
    visit '/sessions/new'
    fill_in(:email, with: 'facts@example.com')
    fill_in(:password, with: 'password12')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, facts@example.com'
    expect(page).to have_content "Please check your email or password\n"
  end
end