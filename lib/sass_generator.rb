module MPB
  class SassGenerator

    def initialize(sizes_hash)
      @sizes = mapped_sizes(sizes_hash)
    end

    def generate
      "#{variables}\n\n#{margins}\n#{paddings}"
    end

    private
    def margins
      combine_gutters(Margin)
    end

    def paddings
      combine_gutters(Padding)
    end

    def variables
      variable_declarations.join("\n")
    end

    def variable_declarations
      @sizes.map{|size| size.declaration}
    end

    def combine_gutters(gutter_klass)
      gutters(gutter_klass).join("\n")
    end

    def gutters(klass)
      @sizes.map {|size| klass.new(size.hash).css}
    end

    def gutter_hash(key)
      {key => variable_name(key)}
    end

    def mapped_sizes(sizes)
      sizes.keys.map {|key| Size.new(key, sizes[key])}
    end

    class Size
      def initialize(key, value)
        @key, @value = [key, value]
      end

      def hash
        {@key => name}
      end

      def declaration
        "#{name}: #{@value};"
      end

      private
      def name
        "$space-#{@key}"
      end
    end

  end
end
