def englishRefactorNew number
  phrase = {1 => "thousand", 2 => "million", 3 => "billion", 4 => "trillion"}
  number_with_commas = number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
  number_split_with_commas = number_with_commas.split("")
  comma_count = number_split_with_commas.count(",")
  number_split_with_commas.each_with_index do |i, index|
    if i == ","
      number_split_with_commas[index] = phrase[comma_count]
      comma_count = comma_count - 1
    end
  end
  puts number_split_with_commas
end

englishRefactorNew(1000000000000)