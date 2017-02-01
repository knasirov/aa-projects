class Employee

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    boss.underlings << selfif boss && boss.is_a?(Manager)
  end

  def bonus(multiplier)
    @salary * multiplier
  end

  def salary
    @salary.dup
  end

end
