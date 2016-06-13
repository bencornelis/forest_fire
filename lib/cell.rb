class Cell
  attr_reader :state

  def initialize(state = nil)
    if state
      @state = state
    else
      @state = (rand < 0.5 ? :empty : :tree )
    end
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
end
