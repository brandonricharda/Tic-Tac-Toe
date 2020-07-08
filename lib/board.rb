class Board

    attr_accessor :positions

    def initialize
        @positions = {}
        (1..9).to_a.each do |key|
            @positions[key] = nil
        end
    end

end