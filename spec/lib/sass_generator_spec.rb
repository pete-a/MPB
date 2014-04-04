require 'spec_helper'
require 'sass_generator'

module MPB
  describe SassGenerator do
    let(:generator) {SassGenerator.new(s: '5px', m: '10px')}
    let(:output) {generator.generate}

    it 'generates sass variables' do
      output.should include '$space-s: 5px;'
      output.should include '$space-m: 10px;'
    end

    it 'generates margins' do
      output.should include '.mas'
      output.should include '.mrs {margin-right: $space-s;}'
      output.should include '.mam'
    end

    it 'generates padding' do
      output.should include '.pas'
      output.should include '.prs {padding-right: $space-s;}'
      output.should include '.pam'
    end

  end
end
