feature 'Viewing facts' do
  scenario 'visiting the index page' do
    fact = Fact.create(text: "The heads on Easter Island have bodies.") 
    sign_up
    expect(page).to have_content(fact.text)
  end
end