require_relative "./instruction"
require_relative "./bounded_planar_surface_world"
require_relative "./simple_robot"
require_relative "./position"

class RobotController
  attr_reader(:robot)

  ACTION_HANDLERS = {
    place: :place,
    move: :move,
    left: :left,
    right: :right,
    report: :report
  }

  def instruct(instruction)
    return unless valid_action?(instruction.action)

    send(
      ACTION_HANDLERS[instruction.action],
      *instruction.arguments
    )
  end

  private

  def valid_action?(action)
    ACTION_HANDLERS.key?(action)
  end

  def place(x,y,direction)
    return if @robot

    world = BoundedPlanarSurfaceWorld.new(0, 4, 0, 4)
    position = Position.new(x, y)

    return unless world.within_bounds?(position)

    @robot = SimpleRobot.new(
      world,
      position,
      direction.to_sym
    )
  end

  def move
    return unless @robot

    @robot.move_forward if @robot.can_move_forward?
  end

  def right
    return unless @robot

    @robot.rotate_right
  end

  def left
    return unless @robot

    @robot.rotate_left
  end

  def report
    return unless @robot

    puts [
      @robot.position.x,
      @robot.position.y,
      @robot.direction.upcase
    ].join(",")
  end
end
