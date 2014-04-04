require 'spec_helper'

module MPB
  describe Padding do
    let(:padding) {Padding.new(sm: '$gutter-small')}

    it 'generates the top css' do
      expect(padding.top_css).to eq ".ptsm {padding-top: $gutter-small;}"
    end

    it 'generates the right css' do
      expect(padding.right_css).to eq ".prsm {padding-right: $gutter-small;}"
    end

    it 'generates the bottom css' do
      expect(padding.bottom_css).to eq ".pbsm {padding-bottom: $gutter-small;}"
    end

    it 'generates the left css' do
      expect(padding.left_css).to eq ".plsm {padding-left: $gutter-small;}"
    end

    it 'generates the all css' do
      expect(padding.all_css).to eq ".pasm {@extend .ptsm, .prsm, .pbsm, .plsm;}"
    end

    it 'generates the vertical css' do
      expect(padding.vertical_css).to eq ".pvsm {@extend .ptsm, .pbsm;}"
    end

    it 'generates the horizontal css' do
      expect(padding.horizontal_css).to eq ".phsm {@extend .prsm, .plsm;}"
    end

    it 'generates the whole css block' do
      css = <<-eos
#{padding.top_css}
#{padding.right_css}
#{padding.bottom_css}
#{padding.left_css}
#{padding.horizontal_css}
#{padding.vertical_css}
#{padding.all_css}
      eos
      expect(padding.css).to eq css
    end

  end
end
