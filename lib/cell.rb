class Cell
  attr_reader :state, :x, :y

  def initialize(state = nil, coords)
    if state
      @state = state
    else
      @state = (rand < 0.5 ? :empty : :tree )
    end
    @coords[:x] = x
    @coords[:y] = y
  end

  def symbol
    dict[state]
  end

  def set_state(new_state)
    @state = new_state
  end

  def empty?
    state == :empty
  end

  def tree?
    state == :tree
  end

  def burning?
    state == :burning
  end

  private
  def dict
    {
      :burning : "b",
      :tree    : "t",
      :empty   : " "
    }
  end
end
