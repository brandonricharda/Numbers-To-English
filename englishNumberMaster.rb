def englishRefactorNew number
  phrase = {1 => "thousand", 2 => "million", 3 => "billion", 4 => "trillion", "HUND" => "hundred"}
  tens = {2 => "twenty", 3 => "thirty", 4 => "forty", 5 => "fifty", 6 => "seventy", 8 => "eighty", 9 => "ninety"}
  teens = {10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen"}
  number_with_commas = number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
  number_array_with_commas = number_with_commas.split("")
  comma_count = number_array_with_commas.count(",")
  number_array_with_commas.each_with_index do |i, index|
    if i == ","
      number_array_with_commas[index] = phrase[comma_count]
      comma_count = comma_count - 1
    elsif i != "0"
      next_item = number_array_with_commas[index + 1]
      second_item_away = number_array_with_commas[index + 2]
      last_item_alert = next_item == nil ? "active" : "inactive"
      if last_item_alert == "inactive" and next_item != "," and second_item_away != ","
        number_array_with_commas[index] += " " + phrase["HUND"]
      elsif last_item_alert == "inactive" and next_item != "," and second_item_away == ","
        number_array_with_commas[index] = tens[i.to_i] != nil ? tens[i.to_i] : i
      end
    end
  end
  puts number_array_with_commas
end

englishRefactorNew(152000000)