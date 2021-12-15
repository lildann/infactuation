require 'fact'
require 'database_helpers'

describe Fact do
  describe '.all' do
    it 'returns all facts' do
      fact = Fact.create(text: 'The heads on Easter Island have bodies.') 
      Fact.create(text: 'Marie Curie is the only person to earn a Nobel prize in two different sciences.') 
      Fact.create(text: 'Sharks can live for five centuries.') 

      facts = Fact.all
      expect(facts.length).to eq(3)
      expect(facts.first).to be_a(Fact)
      expect(facts.first.id).to eq(fact.id)
      expect(facts.first.text).to eq('The heads on Easter Island have bodies.')
    end
  end
end