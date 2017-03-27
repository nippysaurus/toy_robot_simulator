class SimpleRobot
  attr_reader(:world, :position, :direction)

  ROTATION_SEQUENCE = {
    north: { left: :west, right: :east },
    east: { left: :north, right: :south },
    south: { left: :east, right: :west },
    west: { left: :south, right: :north }
  }

  def initialize(world, position, direction)
    @world = world
    @position = position
    @direction = direction
  end

  def move_forward 
    new_position = @position.send(@direction)

    if @world.within_bounds?(new_position)
      @position = new_position
    end
  end

  def rotate_right
    @direction = ROTATION_SEQUENCE[@direction][:right]
  end

  def rotate_left
    @direction = ROTATION_SEQUENCE[@direction][:left]
  end

  def can_move_forward?
    @world.within_bounds?(
      @position.send(@direction)
    )
  end
end
