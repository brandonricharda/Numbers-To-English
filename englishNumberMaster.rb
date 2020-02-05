def englishRefactor number
  phrase = {1 => "", 2 => "teen", 3 => "hundred", 4 => "thousand", 5 => "teen", 6 => "hundred-thousand", 7 => "million", 8 => "million", 9 => "hundred-million", 10 => "billion", 11 => "billion", 12 => "hundred-billion", 13 => "trillion"} 
  numbers = {0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine", "one teen" => "ten", "one teen one" => "eleven", "one teen two" => "twelve", "one teen three" => "thirteen", "one teen four" => "fourteen", "one teen five" => "fifteen", "one teen six" => "sixteen", "one teen seven" => "seventeen", "one teen eight" => "eighteen", "one teen nine" => "nineteen", "two teen" => "twenty", "three teen" => "thirty", "four teen" => "forty", "five teen" => "fifty", "six teen" => "sixty", "seven teen" => "seventy", "eight teen" => "eighty", "nine teen" => "ninety"}
  numberWords = []
  firstDraft = []
  number.to_s.split("").each do |i|
    numberWords.push(numbers[i.to_i])
  end
  numberWords.each_with_index do |i, index|
    remaining = numberWords.count - index
    previous = numberWords[index - 1]
    if i == "zero" and numbers.has_value?(previous)
      whatToAdd = phrase[remaining]
    else
      whatToAdd = i + " " + phrase[remaining]
    end
    if numbers.has_key?(whatToAdd)
      firstDraft.push(numbers[whatToAdd] + " ")
    else
      firstDraft.push(whatToAdd)
    end
  end
  puts firstDraft
end

englishRefactor(10011)

#perhaps I can change the array so that a space is not added between the phrase and the number word