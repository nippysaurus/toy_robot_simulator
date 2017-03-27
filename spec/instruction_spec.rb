require "./lib/instruction"

RSpec.describe Instruction do
  context ".parse" do
    it "handles action with no arguments" do
      instruction = Instruction.parse("MOVE")
      expect(instruction.action).to eql(:move)
      expect(instruction.arguments).to be nil
    end

    it "handles action with arguments" do
      instruction = Instruction.parse("PLACE 0,0,NORTH")
      expect(instruction.action).to eql(:place)
      expect(instruction.arguments).to eql(["0", "0", "north"])
    end

    it "handles action with arguments and odd spacing" do
      instruction = Instruction.parse("   PLACE   0, 0,  NORTH  ")
      expect(instruction.action).to eql(:place)
      expect(instruction.arguments).to eql(["0", "0", "north"])
    end

    it "handles empty input" do
      instruction = Instruction.parse("    ")
      expect(instruction).to be nil
    end
  end
end
