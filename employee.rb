class Employee 
  attr_accessor :name, :title, :salary, :boss
  
  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
    
  end
  
  def bonus(multiplier)
    bonus = @salary * multiplier
  end 
end

class Manager < Employee
  attr_accessor :employees
  
  def initialize(name, title, salary, boss, *arr)
    super(name, title, salary, boss)
    @employees = arr 
  end
  
  def add_employee(name)
  if boss
    boss.employees << name
  end
    @employees << name
  end
  
  def bonus(multiplier)
    @employees.reduce(0) {|sum, employee| sum += employee.salary} * multiplier
  end
end

if __FILE__ == $PROGRAM_NAME
  ned = Manager.new('Ned', 'Founder', 1000000, nil)
  darren = Manager.new('Darren', 'TA Manager', 78000, ned)
  shawan = Employee.new('Shawan', 'TA', 12000, darren)
  david = Employee.new('David', 'TA', 10000, darren)
  darren.add_employee(david)
  ned.add_employee(darren)
  darren.add_employee(shawan)
  p ned.employees.map(&:name)
  p ned.bonus(5)
  p darren.bonus(4)
  p david.bonus(3)
end