require_relative 'employee'

class Manager < Employee

  attr_accessor :underlings
  
  def initialize(name, title, salary, boss)
    super
    @underlings = []
  end

  def bonus(multiplier)
    @underlings.map { |u| u.salary }.reduce(:+) * multiplier
  end


end
