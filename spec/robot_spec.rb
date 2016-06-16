require_relative '../robot.rb'

RSpec.describe "Robot", :type => :request do
	describe "check Robot class" do
		let (:r) {Robot.new}
		
		it "should able to create a new robot object" do

		end

		it "should place robot into board" do
			r.place 0,0,'NORTH'
			expect(r.to_s).to eq("0 0 NORTH")
		end

		it "should move one place towards NORTH" do
			r.place 0,0,'NORTH'
			r.move

			expect(r.to_s).to eq("0 1 NORTH")	
		end

		it "should move one place towards NORTH and one place RIGHT towards EAST" do
			r.place 0,0,'NORTH'
			r.move
			r.right
			r.move

			expect(r.to_s).to eq("1 1 EAST")	
		end

		it "should move one place towards NORTH and one place LEFT towards WEST" do
			r.place 1,1,'NORTH'
			r.move
			r.left
			r.move

			expect(r.to_s).to eq("0 2 WEST")	
		end

		[
			{face: "NORTH", new_face: "WEST"}, 
			{face: "SOUTH", new_face: "EAST"}, 
			{face: "WEST", new_face: "SOUTH"}, 
			{face: "EAST", new_face: "NORTH"}
		].each do |direction|
			it "should rotate face left(#{direction[:face]} to #{direction[:new_face]})" do
				r.place 0,0, direction[:face]
				r.left	

				expect(r.to_s).to eq("0 0 #{direction[:new_face]}")
			end
		end

		[
			{face: "SOUTH", new_face: "WEST"}, 
			{face: "NORTH", new_face: "EAST"}, 
			{face: "EAST", new_face: "SOUTH"}, 
			{face: "WEST", new_face: "NORTH"}
		].each do |direction|
			it "should rotate face left(#{direction[:face]} to #{direction[:new_face]})" do
				r.place 0,0, direction[:face]
				r.right	

				expect(r.to_s).to eq("0 0 #{direction[:new_face]}")
			end
		end
	end
end