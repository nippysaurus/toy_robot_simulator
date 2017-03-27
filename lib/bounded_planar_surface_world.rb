class BoundedPlanarSurfaceWorld
  def initialize(x_min = 0, x_max = 4, y_min = 0, y_max = 4)
    @x_min = x_min
    @x_max = x_max
    @y_min = y_min
    @y_max = y_max
  end

  def within_bounds?(position)
    [
      x_range.cover?(position.x),
      y_range.cover?(position.y)
    ].all?
  end

  private

  def x_range
    @x_min..@x_max
  end

  def y_range
    @y_min..@y_max
  end
end
