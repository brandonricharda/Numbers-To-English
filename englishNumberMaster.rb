def englishRefactor number
  phrase = {1 => "", 2 => "teen", 3 => "hundred", 4 => "thousand", 5 => "thousand", 6 => "hundred thousand", 7 => "million", 8 => "million", 9 => "hundred million", 10 => "billion", 11 => "billion", 12 => "hundred billion", 13 => "trillion"} 
  ones = {0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine"}
  tens = {"one teen zero" => "ten", "two teen" => "twenty", "three teen" => "thirty", "four teen" => "forty", "five teen" => "fifty", "six teen" => "sixty", "seven teen" => "seventy", "eight teen" => "eighty", "nine teen" => "ninety"}
  teenagers = {"one teen one" => "eleven", "one teen two" => "twelve", "one teen three" => "thirteen", "one teen four" => "fourteen", "one teen five" => "fifteen", "one teen six" => "sixteen", "one teen seven" => "seventeen", "one teen eight" => "eighteen", "one teen nine" => "nineteen"}
  numberWords = []
  firstDraft = ""
  number.to_s.split("").each do |i|
    numberWords.push(ones[i.to_i])
  end
  numberWords.each_with_index do |i, index|
    remaining = numberWords.count - index
    firstDraft += i + " " + phrase[remaining] + " "
  end
  firstDraftArray = firstDraft.split(" ")
  puts firstDraftArray
  puts "SPLIT"
  firstDraftArray.each_with_index do |i, index|
    if i == "teen"
      if firstDraftArray[index + 1] != "zero"
        firstDraftArray[index] = tens[firstDraftArray[index - 1] + " " + i]
        firstDraftArray.delete_at(index - 1)
      else
        firstDraftArray[index] = tens[firstDraftArray[index - 1] + " " + i]
        firstDraftArray.delete_at(index + 1)
        firstDraftArray.delete_at(index - 1)
      end
    end
  end
  puts firstDraftArray
end

englishRefactor(10000)