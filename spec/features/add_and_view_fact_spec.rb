feature 'Adding a fact' do
  scenario 'a user can add a fact to the page' do
    sign_up
    fill_in('text', with: 'The average person has about 300 million skin cells.')
    click_button('I do in fact')
    expect(page).to have_content('The average person has about 300 million skin cells.')
  end
end