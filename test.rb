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
		@board = Board.new 7, 7
	end

	def place x, y, f
		@x, @y, @f = x, y, f
	end

	def move
		if @f == 'NORTH'
			@y += 1 if @y >= 0 and @y < (@board.height - 1)
		elsif @f == 'SOUTH'
			@y -= 1 if @y > 0 and @y <= (@board.height - 1)
		elsif @f == 'EAST'
			@x += 1 if @x >= 0 and @x < (@board.width - 1)
		elsif @f == 'WEST'
			@x -= 1 if @x > 0 and @x <= (@board.width - 1)
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
		puts "#{@x} :: #{@y} :: #{@f}"
	end
end