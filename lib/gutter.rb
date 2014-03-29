class Gutter
  attr_accessor :key, :value

  def initialize(hash)
    @key = hash.keys.first
    @value = hash[@key]
  end

  def css
    <<-eos
#{top_css}
#{right_css}
#{bottom_css}
#{left_css}
#{horizontal_css}
#{vertical_css}
    eos
  end

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
    "#{self.class::ATTRIBUTE_TYPE}-#{direction}: #{@value};"
  end

  def selector(prefix)
    ".#{self.class::ATTRIBUTE_PREFIX}#{prefix}#{@key}"
  end
end
