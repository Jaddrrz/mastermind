class Test
  attr_accessor :test

  def initialize(test) 
    @test = test
  end
end

test3 = Test.new("name")
puts test3.test
test3.test = "newname"
puts test3.test