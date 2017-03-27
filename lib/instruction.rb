class Instruction
  attr_reader(:action, :arguments)

  def initialize(action, arguments = nil)
    @action = action
    @arguments = arguments
  end

  def self.parse(instruction)
    instruction.strip!

    return nil if instruction == ""

    action,arguments = instruction.split(" ", 2)

    arguments &&= arguments.split(",").map(&:strip).map(&:downcase)

    Instruction.new(
      action.downcase.to_sym,
      arguments
    )
  end
end
