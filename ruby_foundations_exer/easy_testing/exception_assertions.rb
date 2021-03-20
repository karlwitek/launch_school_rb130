# Write a minitest that will fail unless employee.hire raises a NoExperience exception.

# (student solution)  REVIEW

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Employee
  def initialize(experience)
    @experience = experience
  end

  def hire
    raise 'NoExperienceError' if @experience == false
    true
  end
end

class EmployeeTest < MiniTest::Test

  def setup
    @employee = Employee.new(false)
  end

  def test_employee_hire
    assert_raises('NoExperienceError') { @employee.hire }
  end
end

# #assert_raises checks if the given block raises an exception of the named type. If it does not, 
# the assertion fails.

# another student solution:

class NoExperienceError < StandardError; end

class Employee
  def initialize(experience = false)
    @experience = experience
  end

  def hire
    raise NoExperienceError unless @experience
    @hired = true
  end
end

class RaiseExceptionTest < MiniTest::Test
  def test_exception
    assert_raises NoExperienceError do
      employee = Employee.new
      employee.hire
    end
  end
end

