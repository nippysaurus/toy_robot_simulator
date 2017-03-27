require "./lib/robot_controller"

def capture_output
  backup = $stdout
  $stdout = StringIO.new
  yield
  $stdout.string
ensure
  $stdout = backup
end

RSpec.describe RobotController do
  let(:controller) { RobotController.new }

  it "ignores unrecognised actions" do
    controller.instruct(Instruction.new(:invalid))
  end

  it "does not move if not placed on the surface yet" do
    controller.instruct(Instruction.new(:move))
    expect(controller.robot).to be nil
  end

  it "creates the robot after place command and coordinates within bounds" do
    controller.instruct(Instruction.new(:place, ["0", "0", "north"]))
    expect(controller.robot).to_not be nil
    expect(controller.robot.position.x).to eql(0)
    expect(controller.robot.position.y).to eql(0)
    expect(controller.robot.direction).to eql(:north)
  end

  it "does not creates the robot after place command and coordinates outside bounds" do
    controller.instruct(Instruction.new(:place, ["100", "100", "north"]))
    expect(controller.robot).to be nil
  end

  it "does not move if it would fall off the surface" do
    controller.instruct(Instruction.new(:place, ["0", "0", "south"]))
    controller.instruct(Instruction.new(:move))
    expect(controller.robot.position.x).to eql(0)
    expect(controller.robot.position.y).to eql(0)
  end

  it "moves if movement would keep it on the table" do
    controller.instruct(Instruction.new(:place, ["0", "0", "north"]))
    controller.instruct(Instruction.new(:move))
    expect(controller.robot.position.x).to eql(0)
    expect(controller.robot.position.y).to eql(1)
  end

  it "can rotate left to avoid falling off" do
    controller.instruct(Instruction.new(:place, ["0", "0", "south"]))
    controller.instruct(Instruction.new(:move))
    expect(controller.robot.position.x).to eql(0)
    expect(controller.robot.position.y).to eql(0)
    controller.instruct(Instruction.new(:left))
    controller.instruct(Instruction.new(:move))
    expect(controller.robot.position.x).to eql(1)
    expect(controller.robot.position.y).to eql(0)
    expect(controller.robot.direction).to eql(:east)
  end

  it "can rotate right to avoid falling off" do
    controller.instruct(Instruction.new(:place, ["0", "0", "west"]))
    controller.instruct(Instruction.new(:move))
    expect(controller.robot.position.x).to eql(0)
    expect(controller.robot.position.y).to eql(0)
    controller.instruct(Instruction.new(:right))
    controller.instruct(Instruction.new(:move))
    expect(controller.robot.position.x).to eql(0)
    expect(controller.robot.position.y).to eql(1)
    expect(controller.robot.direction).to eql(:north)
  end

  it "can report and print current position" do
    stdout = capture_output do
      controller.instruct(Instruction.new(:place, ["0", "0", "east"]))
      controller.instruct(Instruction.new(:report))
      controller.instruct(Instruction.new(:move))
      controller.instruct(Instruction.new(:left))
      controller.instruct(Instruction.new(:move))
      controller.instruct(Instruction.new(:report))
    end
    expect(stdout).to eql("0,0,EAST\n1,1,NORTH\n")
  end
end
