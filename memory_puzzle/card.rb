class Card
    attr_reader :face_value, :up_down

    def initialize(face_value)
        @face_value = face_value
        @up_down = false
    end

    def hide
        @up_down = false
    end

    def reveal
        @up_down = true
    end

    def to_s
        @face_value = @face_value.to_s
    end

    def ==(other)
        self.face_value == other.face_value
    end 
end 