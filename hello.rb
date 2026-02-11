class Greeter
  def initialize(name = "World")
    @name = name
  end
  
  def say_hello
    puts "Hello, #{@name}!"
  end
end

greeter = Greeter.new("Ruby")
greeter.say_hello
