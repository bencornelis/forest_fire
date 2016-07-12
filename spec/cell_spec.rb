require "cell"

describe Cell do
  it "is initially empty or a tree" do
    expect([:empty, :tree]).to include(Cell.new.state)
  end

  describe "#set_state" do
    it "changes the cell's state" do
      cell = Cell.new
      cell.set_state(:burning)
      expect(cell.state).to eq(:burning)
    end
  end

  let(:empty_cell)   { Cell.new(state: :empty) }
  let(:tree_cell)    { Cell.new(state: :tree) }
  let(:burning_cell) { Cell.new(state: :burning) }

  describe "#empty?" do
    it "is true if the cell is empty" do
      expect(empty_cell.empty?).to be true
      expect(tree_cell.empty?).to be false
    end
  end

  describe "#tree?" do
    it "is true if the cell has a tree" do
      expect(tree_cell.tree?).to be true
      expect(burning_cell.tree?).to be false
    end
  end

  describe "#burning?" do
    it "is true if the cell has a burning tree" do
      expect(burning_cell.burning?).to be true
      expect(empty_cell.burning?).to be false
    end
  end
end
