## Difficult Mode:
### Question method
def question(prompt,body)
  print prompt
  puts body
end

question("1. ", 4 == 2 * 2)
question("2. ", 5 > 4)
question("3. ", (3 * 4) > 10)
question("4. ", 3 == 3)
question("5. ", (1 > 0) && (1 <= 1) == true)
question("6. ", 21 != 2)
question("7. ", (14 <= 10) || (3 >= 3) == true)
question("8. ", 10 % 2 == 0)
question("9. ", 100 == 10 ** 2)
question("10. ", 6 == 1000 / (300 / 2))

#I AM A COMMENT RUBY IGNORES ME BECAUSE MY LINE STARTED WITH A '#'
#Use the following variable msg for questions 11 - 15
msg = "hEllO"

question("11. ", msg.upcase == "HELLO")
question("12. ", msg.swapcase == "HeLLo")
question("13. ", msg.reverse == "OllEh")
question("13a. ", msg.upcase.reverse == "OLLEH")

arr = ['a', 'b', 'c']

question("14. ", arr[2] == 'c')
question("15. ", 3 == arr.count)
question("16. ", arr.join(',') == 'a,b,c')

#Hint: This will take 2 method calls

question("17. ", arr.last.upcase == 'C')

hsh = { name: 'Fido', age: '99' }

question("18. ", hsh[:name] == 'Fido')
question("19. ", hsh.keys == [:name, :age])
question("20. ", hsh.values == ['Fido', '99'])
question("21. ", hsh.merge({:special => "Dog"}) == { name: 'Fido', age: '99', special: 'Dog' })
