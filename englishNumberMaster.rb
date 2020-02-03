def identifyPhrase length
  if length == 3
    phrase = "hundred"
  elsif length >= 4 and length < 7
    if length == 4 or length == 5
      phrase = "thousand"
    elsif length == 6
      phrase = "hundred thousand"
    end
  elsif length >= 7 and length < 10
    if length == 8 or length == 7
      phrase = "million"
    elsif length == 9
      phrase = "hundred million"
    end
  elsif length >= 10 and length < 13
    if length == 10 or length == 1
      phrase = "billion"
    elsif length == 12
      phrase = "hundred billion"
    end
  elsif length >= 13
    phrase = "trillion"
  elsif length == 2
    phrase = "teen"
  elsif length == 1
    phrase = ""
  end
  return phrase
end

def englishNumber number
  ones = {0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine"}
  teenagers = {"one one" => "eleven", "one two" => "twelve", "one three" => "thirteen", "one four" => "fourteen", "one five" => "fifteen", "one six" => "sixteen", "one seven" => "seventeen", "one eight" => "eighteen", "one nine" => "nineteen"}
  tens = {"one" => "ten", "two" => "twenty", "three" => "thirty", "four" => "forty", "five" => "fifty", "six" => "sixty", "seven" => "seventy", "eight" => "eighty", "nine" => "ninety"}
  lengthArray = []
  numberToString = number.to_s
  numberWords = []
  numberIntoWords = ""
  numberToString.split("").each do |i|
    numberWords.push(ones[i.to_i])
  end
  numberOfNumbers = numberWords.count
  numberWords.each_with_index do |i, index|
    remaining = numberOfNumbers - index
    if remaining != 2 and i != "zero"
      if remaining == 5
        if numberWords[index + 1] == "zero"
          numberIntoWords += tens[i] + " " + identifyPhrase(remaining) + " "
        else
          numberIntoWords += teenagers[i + " " + numberWords[index + 1]] + " "
        end
      elsif remaining == 6
        if numberWords[index + 1] == "zero"
          numberIntoWords += i + " " + identifyPhrase(remaining) + " "
        else
          numberIntoWords += i + " hundred" + " "
        end
      else
        numberIntoWords += i + " " + identifyPhrase(remaining) + " "
      end
    elsif remaining == 2 and i != "zero"
      numberIntoWords += tens[i] + " "
    elsif remaining == 1
      if numberIntoWords.split(" ").last != "eleven"
      end
    end
  end
  puts numberIntoWords
end

englishNumber(13000)