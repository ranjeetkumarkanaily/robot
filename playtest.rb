require_relative 'test.rb'

class Command
	def initialize file_path
		@file_path = file_path
		@robot = Robot.new
	end

	def readFile 
		file = File.open(@file_path, "r")
		file.each_line do |line|
			command line
		end
	end

	def command commndsArguments
		cmd, args = commndsArguments.split(" ")
		case cmd
		when 'PLACE'
			return false if args.length == 3 
			argsArray = args.split(',')
			x, y, face = argsArray
			@robot.place x.to_i, y.to_i, face		
		when 'MOVE'
			@robot.move
		when 'LEFT'
			@robot.left
		when 'RIGHT'
			@robot.right
		when 'REPORT'
			@robot.to_s
		end
	end

end

cmd = Command.new "play.txt"
cmd.readFile