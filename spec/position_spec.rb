require "./lib/position"

RSpec.describe Position do
  it ".new converts coordinates to integers" do
    expect(Position.new("0", "0").coords).to eql([0, 0])
  end

  it ".to_s returns a correct representation of the coordinates" do
    expect(Position.new(1, 2).to_s).to eql("1,2")
  end

  it ".north returns position one space north" do
    expect(Position.new(0, 0).north.coords).to eql([0, 1])
  end

  it ".east returns position one space east" do
    expect(Position.new(0, 0).east.coords).to eql([1, 0])
  end

  it ".south returns position one space south" do
    expect(Position.new(0, 0).south.coords).to eql([0, -1])
  end

  it ".west returns position one space west" do
    expect(Position.new(0, 0).west.coords).to eql([-1, 0])
  end
end
