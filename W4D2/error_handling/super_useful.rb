# PHASE 2
def convert_to_int(str)
  begin  
    number = Integer(str)
  rescue ArgumentError => e
    # puts e.message
    puts "Couldn't convert to integer"
  ensure
    number ||= nil
  end
end

# p convert_to_int('123')
# p convert_to_int('abc')

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class NotFruitError < StandardError
  def message
    p "That's not fruit!"
  end
end

class CoffeeError < StandardError 
  def message
    p "That's not fruit, but I like coffee so you can try again."
  end
end


def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == 'coffee'
    raise CoffeeError
  else
    raise NotFruitError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue NotFruitError => e
    puts e.message
  rescue CoffeeError => e 
    puts e.message
    retry
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise StandardError.new("'yrs_known' must be ast least five years to be considered best friends") if yrs_known < 5
    raise StandardError.new("'name' must be provided")if name.length <= 0
    raise StandardError.new("'fav_pastime' must be provided") if fav_pastime.length <=0
    
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


# Sally = BestFriend.new('Sally', 6, 'running')
# p Sally

# Mike = BestFriend.new('', 6, 'biking')
# p Mike

# George = BestFriend.new('George', 2, '')
# p George

