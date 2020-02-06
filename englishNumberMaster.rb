def englishRefactorNew number
  phrase = {"1" => "thousand", "2" => "million", "3" => "billion", "4" => "trillion", "HUND" => "hundred"}
  ones = {"1" => "one", "2" => "two", "3" => "three", "4" => "four", "5" => "five", "6" => "six", "7" => "seven", "8" => "eight", "9" => "nine"}
  teens = {"10" => "ten", "11" => "eleven", "12" => "twelve", "13" => "thirteen", "14" => "fourteen", "15" => "fifteen", "16" => "sixteen", "17" => "seventeen", "18" => "eighteen", "19" => "nineteen"}
  tens = {"2" => "twenty", "3" => "thirty", "4" => "forty", "5" => "fifty", "6" => "sixty", "7" => "seventy", "8" => "eighty", "9" => "ninety"}
  number_with_commas = number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
  number_array_with_commas = number_with_commas.split("")
  comma_count = number_array_with_commas.count(",")
  number_array_with_commas.each_with_index do |i, index|
    next_item = number_array_with_commas[index + 1]
    second_item_away = number_array_with_commas[index + 2]
    last_item_alert = next_item == nil ? "active" : "inactive"
    single_digit = (next_item == "," or last_item_alert == "active") ? "active" : "inactive"
    double_digit = (second_item_away == "," or second_item_away == nil and last_item_alert == "inactive") ? "active" : "inactive"
    triple_digit = (single_digit == "inactive" and double_digit == "inactive" and i != ",") ? "active" : "inactive"
    if i == ","
      number_array_with_commas[index] = phrase[comma_count.to_s]
      comma_count = comma_count - 1
    elsif i != "0"
      if triple_digit == "active"
        number_array_with_commas[index] += " " + phrase["HUND"]
      elsif double_digit == "active"
        if tens[i] != nil then number_array_with_commas[index] = tens[i] end
        if teens[i + next_item] != nil
          number_array_with_commas[index] = teens[i + next_item] 
          number_array_with_commas.delete_at(index + 1)
        end
      end
    end
  end
  puts number_array_with_commas
end

englishRefactorNew(13564876)