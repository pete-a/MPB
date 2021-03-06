require 'spec_helper'

module MPB
  describe Margin do
    let(:margin) {Margin.new(sm: '$gutter-small')}

    it 'generates the top css' do
      expect(margin.top_css).to eq ".mtsm {margin-top: $gutter-small;}"
    end

    it 'generates the right css' do
      expect(margin.right_css).to eq ".mrsm {margin-right: $gutter-small;}"
    end

    it 'generates the bottom css' do
      expect(margin.bottom_css).to eq ".mbsm {margin-bottom: $gutter-small;}"
    end

    it 'generates the left css' do
      expect(margin.left_css).to eq ".mlsm {margin-left: $gutter-small;}"
    end

    it 'generates the all css' do
      expect(margin.all_css).to eq ".masm {@extend .mtsm, .mrsm, .mbsm, .mlsm;}"
    end

    it 'generates the vertical css' do
      expect(margin.vertical_css).to eq ".mvsm {@extend .mtsm, .mbsm;}"
    end

    it 'generates the horizontal css' do
      expect(margin.horizontal_css).to eq ".mhsm {@extend .mrsm, .mlsm;}"
    end

    it 'generates the whole css block' do
      css = <<-eos
#{margin.top_css}
#{margin.right_css}
#{margin.bottom_css}
#{margin.left_css}
#{margin.horizontal_css}
#{margin.vertical_css}
#{margin.all_css}
      eos
      expect(margin.css).to eq css
    end

  end
end
