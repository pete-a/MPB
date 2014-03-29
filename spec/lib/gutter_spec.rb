require_relative '../../lib/gutter'
describe Gutter do
  it 'initializes with a hash of sybmol and number' do
    gutter = Gutter.new(sm: 5)
    expect(gutter.key).to eq :sm
    expect(gutter.value).to eq 5
  end
end
