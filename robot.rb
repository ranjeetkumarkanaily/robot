class Board
	attr_reader :width, :height

	def initialize x, y
		@width = x
		@height = y
	end

end

class Robot
	def initialize
		@x, @y = 0, 0
		@f = ''
		@board = Board.new 5, 5
	end

	def place x, y, f
		@x, @y, @f = x, y, f
	end

	def move
		x = @x
		y = @y
		case @f
		when 'NORTH'
			y += 1
		when 'SOUTH'
			y -= 1
		when 'EAST'
			x += 1
		when 'WEST'
			x -= 1
		end
		if x >= 0 or y >= 0 or x < @board.width or y < @board.height
			@x = x
			@y = y
		end
	end

	def left
		@f = case @f
		when 'NORTH'
			'WEST'
		when 'SOUTH'
			'EAST'
		when 'EAST'
			'NORTH'
		when 'WEST'
			'SOUTH'
		end
	end

	def right
		@f = case @f
		when 'NORTH'
			'EAST'
		when 'SOUTH'
			'WEST'
		when 'EAST'
			'SOUTH'
		when 'WEST'
			'NORTH'
		end
	end

	def to_s
		"#{@x} #{@y} #{@f}"
	end
end