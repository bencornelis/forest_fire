class Forest
  attr_reader :p, :f, :size, :grid

  def initialize(params)
    # p - probability an empty space fills with a tree
    # f - probability an isolated tree ignites
    @p = params[:p]
    @f = params[:f]
    @size = params[:size]
    populate_grid
  end

  def next
    new_grid = []
    grid.each do |row|
      new_row = []
      row.each do |cell|
        new_state = find_new_state(cell)
        new_cell = Cell.new(state: new_state, x: cell.x, y: cell.y)
        new_row << new_cell
      end
      new_grid << new_row
    end
    @grid = new_grid
  end

  def display
    puts "t - tree"
    puts "b - burning tree"
    puts "----------------------------"
    grid.each { |row| puts row.map(&:symbol).join }
    puts "----------------------------"
  end

  private
  def populate_grid
    @grid = []
    (0...size).each do |y|
      row = []
      (0...size).each do |x|
        row << Cell.new(x: x, y: y)
      end
      @grid << row
    end
  end

  def find_new_state(cell)
    case cell.state
    when :empty
      rand < p ? :tree : :empty
    when :tree
      neighbor_states = find_neighbors(cell).map(&:state)
      if neighbor_states.include?(:burning)
        :burning
      else
        rand < f ? :burning : :tree
      end
    when :burning
      :empty
    end
  end

  def find_neighbors(cell)
    neighbors = []
    x = cell.x
    y = cell.y
    (x-1..x+1).each do |i|
      (y-1..y+1).each do |j|
        if i.between?(0, size-1) && j.between?(0, size-1)
          if [i,j] != [x, y]
            neighbors << grid[j][i]
          end
        end
      end
    end
    neighbors
  end
end
