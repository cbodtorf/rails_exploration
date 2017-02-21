# paths/84/units/229/assignments/548

# Ruby Data

## PART 1
# Create an array of the words in the sentence below
# Find how many words have a length equal to 5

exSentence = "Tacos must not have lettuce Only meat and cheese and salsa"

sentenceArray = exSentence.split(' ')
puts "sentenceArray #{sentenceArray}"

wordsFiveLong = sentenceArray.select do |word|
  if word.length == 5
    word
  end
end
puts "words with 5 letters = #{wordsFiveLong.count}"


## PART 2: Enumerable
# Create an array of movies with budgets less than 100
# Create an array of movies that have Leonardo DiCaprio as a star
movies = []

movies << {
  title: "Forest Gump",
  budget: 55,
  stars: ["Tom Hanks"]
}
movies << {
  title: "Star Wars",
  budget: 11,
  stars: ["Mark Hamill", "Harrison Ford"]
}
movies << {
  title: "Batman Begins",
  budget: 150,
  stars: ["Christian Bale", "Liam Neeson", "Michael Caine"]
}
movies << {
  title: "Titanic",
  budget: 200,
  stars: ["Kate Winslet", "Leonardo DiCaprio"]
}
movies << {
  title: "Inception",
  budget: 160,
  stars: ["Leonardo DiCaprio", "JGL"]
}

puts "\nmovies with a budget under 100: "
moviesWithBudgetUnder100 = movies.select do |movie|
  if movie[:budget] < 100
    puts movie[:title]
  end
end
puts "\nmovies with leo starring in it: "
moviesWithLeo = movies.select do |movie|
  if movie[:stars].include? "Leonardo DiCaprio"
    puts movie[:title]
  end
end
