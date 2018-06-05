require 'pp'

RSpec.describe 'differ_formater' do
  context 'no difference' do
    it 'is similar' do
      expect('e').to eq('e')
    end
  end

  context 'with a basic string' do
    let(:long_string_with_Z) { "a"*100 + "Z" + "a"*100 }
    let(:long_string) { "a" * (1 + 100*2) }

    it 'display only the change in the middle' do
      expect(long_string_with_Z).to eq(long_string)
    end
  end

  context 'with a recursive array' do
    let(:input) do
      array = [time]
      array << ["a"*100 + "Z" + "a"*100]
      array
    end
    let(:expected) do
      array = [time]
      array << ["a"*100 + "Z" + "a"*100]
      array << "a"*100 + "Z" + "a"*100
      array
    end

    let(:time) { Time.utc(1969, 12, 31, 19, 01, 40, 101) }

    it 'formats the recursive element as [...] and other elements with custom formatting' do
      expect(input).to eq(expected)
    end
  end

  context 'recursive hash with same content' do
    let(:input) do
      hash = {}
      hash[:array] = [:next_is_recursive_hash]
      hash
    end

    let(:output) do
      hash = {}
      hash[:array] = [:next_is_recursive_hash, hash]
      hash
    end

    it { expect(input).to eq(output) }
  end
end
