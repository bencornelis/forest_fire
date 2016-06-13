class Forest
  attr_reader :p, :f, :size

  def initialize(attr)
    # p - probability an empty space fills with a tree
    # f - probability an isolated tree ignites
    @p = p
    @f = f
    @size = size
  end
end
