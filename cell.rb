require 'set'
class Cell

  def initialize(x:, y:, value: nil)
    @x = x
    @y = y 
    @value = (1..9).include?(value.to_i) ? value.to_i : nil 
    @possible_values = @value.nil? ? Set.new((1..9)) : Set.new([@value])
    @box = x/3 + y/3 * 3
  end

  attr_reader :x, :y, :value, :possible_values, :box
  attr_writer :value, :possible_values

  def position
    [x,y]
  end

  def unique_str
    "#{value || 0}+[#{possible_values.to_a.join}]"
  end

end