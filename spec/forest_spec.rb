require "forest"

describe Forest do
  it "has a grid with the input size" do
    forest = Forest.new(size: 10)
    expect(forest.grid.size).to eq(10)
    expect(forest.grid[0].size).to eq(10)
  end
end
