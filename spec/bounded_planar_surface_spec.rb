require "./lib/bounded_planar_surface_world"
require "./lib/position"

RSpec.describe BoundedPlanarSurfaceWorld do
  let(:world) { BoundedPlanarSurfaceWorld.new }

  context ".within_bounds?" do
    it "is true when position is right in the center" do
      position = Position.new(0,0)
      expect(world.within_bounds?(position)).to be true
    end

    {
      top: Position.new(2, 4),
      right: Position.new(4, 2),
      bottom: Position.new(2, 0),
      left: Position.new(0, 2)
    }.each do |direction, position|
      it "is true when position is just within the #{direction} bound" do
        expect(world.within_bounds?(position)).to be true
      end
    end

    {
      top: Position.new(0, 5),
      right: Position.new(5, 0),
      bottom: Position.new(0, -1),
      left: Position.new(-1, 0)
    }.each do |direction, position|
      it "is false when position is just outside the #{direction} bound" do
        expect(world.within_bounds?(position)).to be false
      end
    end
  end
end
