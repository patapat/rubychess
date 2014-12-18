module Chess

  class Player
    attr_reader :name, :symbol_color

    def initialize(name, symbol_color)
      @name = name
      @symbol_color = symbol_color
    end
  end
end
