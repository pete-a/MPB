module MPB
  class SassGenerator

    def initialize(sizes)
      @sizes = sizes.map do |size|
        Size.new(size[0], size[1])
      end
    end

    def generate
      "#{variables}\n\n#{margins}\n#{paddings}"
    end

    private
    def margins
      generate_gutters(Margin)
    end

    def paddings
      generate_gutters(Padding)
    end

    def variables
      variable_declarations.join("\n")
    end

    def variable_declarations
      @sizes.map{|size| size.declaration}
    end

    def generate_gutters(gutter_klass)
      gutters(gutter_klass).join("\n")
    end

    def gutters(klass)
      @sizes.map {|size| klass.new(size.hash).css}
    end

    def gutter_hash(key)
      {key => variable_name(key)}
    end

    class Size
      def initialize(key, value)
        @key, @value = [key, value]
      end

      def name
        "$space-#{@key}"
      end

      def hash
        {@key => name}
      end

      def declaration
        "#{name}: #{@value};"
      end
    end

  end
end
