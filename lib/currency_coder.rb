require "currency_coder/version"

class CurrencyCoder
  VOWELS     = %w[A I U E O]
  CONSONANTS = %w[B C D F G H J K L M P Q R S T V W X Y Z]

  def as_currency_code(name)
    name = name.dup.upcase

    first    = name[0]
    code_ary = [first]
    name     = name[1..-1]

    # The last "N" is always used.
    if name[-1] == "N"
      code_ary[2] = "N"
      name = name[0..-2]
    end

    parts = name.split(Regexp.new("[#{VOWELS.join}]+"))
    parts = parts.select { |p| p != "" }
    parts = parts.map do |p|
      if m = p.match(Regexp.new("([N]+)[#{CONSONANTS.join}]+"))
        p = p[(m[1].length)..-1]
      end
      p
    end

    if !code_ary[2].nil?
      code_ary[1] = select_special_chars(parts, 1)
    elsif parts.length == 2
      code_ary[1..2] = parts.map { |p| p[0] }
    else
      code_ary[2] = parts[-1][0]
      parts = parts[0..-2]
      code_ary[1..2] = select_special_chars(parts, 2)
    end

    code_ary.join
  end

  private

  def select_special_chars(str_ary, count)
    if count == 1
      if str_ary.select { |s| s[0] == "Z" }.count != 0
        return "Z" 
      else
        return str_ary[0][0]
      end
    else
      if idx = str_ary.find_index { |s| s[0] == "Z" }
        return str_ary[idx..-1] 
      else
        return str_ary
      end
    end
  end
end
