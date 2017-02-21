# paths/84/units/229/assignments/547

## Epic Mode:
### Question method
def questionMethod(prompt,body)
  print prompt
  puts body
end

msg = "hEllO"
arr = ['a', 'b', 'c']
hsh = { name: 'Fido', age: '99' }

dataQuestions = [ 4 == 2 * 2,
                  5 > 4,
                  (3 * 4) > 10,
                  3 == 3,
                  (1 > 0) && (1 <= 1) == true,
                  21 != 2,
                  (14 <= 10) || (3 >= 3) == true,
                  10 % 2 == 0,
                  100 == 10 ** 2,
                  6 == 1000 / (300 / 2),
                  msg.upcase == "HELLO",
                  msg.swapcase == "HeLLo",
                  msg.reverse == "OllEh",
                  msg.upcase.reverse == "OLLEH",
                  arr[2] == 'c',
                  3 == arr.count,
                  arr.join(',') == 'a,b,c',
                  arr.last.upcase == 'C',
                  hsh[:name] == 'Fido',
                  hsh.keys == [:name, :age],
                  hsh.values == ['Fido', '99'],
                  hsh.merge({:special => "Dog"}) == { name: 'Fido', age: '99', special: 'Dog' }
                ]

dataQuestions.each_with_index { |q, idx| questionMethod("#{idx + 1}. ", q) }
