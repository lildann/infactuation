feature 'Testing infrastructure' do
  scenario 'Can run app and check page content' do
    visit('/')
    expect(page).to have_content('Facts')
    expect(page).not_to have_content('Sinatra')
  end
end