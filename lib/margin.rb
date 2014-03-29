require 'gutter'

module MPB
  class Margin < Gutter

    def top_css
      "#{selector 't'} {#{attributes 'top'}}"
    end

    def right_css
      "#{selector 'r'} {#{attributes 'right'}}"
    end

    def bottom_css
      "#{selector 'b'} {#{attributes 'bottom'}}"
    end

    def left_css
      "#{selector 'l'} {#{attributes 'left'}}"
    end

    def all_css
      "#{selector 'a'} {@extend #{selector 't'}, #{selector 'r'}, #{selector 'b'}, #{selector 'l'};}"
    end

    def vertical_css
      "#{selector 'v'} {@extend #{selector 't'}, #{selector 'b'};}"
    end

    def horizontal_css
      "#{selector 'h'} {@extend #{selector 'r'}, #{selector 'l'};}"
    end

    private
    def attributes(direction)
      "margin-#{direction}: #{@value};"
    end

    def selector(prefix)
      ".m#{prefix}#{@key}"
    end

  end
end
