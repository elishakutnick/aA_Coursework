require_relative "./employee"

class Manager < Employee 
  attr_accessor :employees


  def initialize(name, title, salary, boss=nil)
    super(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    total = 0
    all_subs = @employees.dup

    i = 0
    while i < all_subs.length
      sub = all_subs[i]
      if !sub.is_a?(Manager)
        total += sub.salary
      else
        total += sub.salary 
        all_subs += sub.employees
      end
      i += 1
    end

    total * multiplier
  end

end

darren = Manager.new('Darren', 'TA Manager', 78000)
darren.employees = [Employee.new('Shawna', 'TA', 12000, darren), Employee.new('David', 'TA', 10000, darren)]

ned = Manager.new('Ned', 'Founder', 1000000)
ned.employees = [darren]

p ned.bonus(5)
p darren.bonus(4)
