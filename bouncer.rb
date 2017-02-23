# Understand how to use documentation, looping, input, output,
# writing methdos and send messages to objects in Ruby.

# BOUNCER

def check_age(age)
  if age == "quit"
    puts "bye!"
  else
    age = age.to_i
    case age
    when 0...18
      puts "You can do nothing"
    when 18...21
      puts "I can vote"
      puts "I can smoke"
    when 21...25
      puts "I can vote"
      puts "I can smoke"
      puts "I can drink"
    when 25..100
      puts "I can vote"
      puts "I can smoke"
      puts "I can drink"
      puts "I can rent a car"
    else
      puts "hmm?"
      puts age == 12
    end

    puts "\nHow old are you?"
    check_age(gets.chomp)
  end
end

puts "How old are you?"
check_age(gets.chomp)
