class PhoneNumber
  def self.clean(pn)
    stripped = strip_non_numeric(pn)
    stripped = check_exchange(stripped)
    check_after_strip(stripped)
  end

  def self.check_after_strip(pn)
    return nil unless pn
    return nil if pn.length < 10
    return nil if pn.length == 10 && "01".include?(pn[0])
    return nil if pn.length == 11 && pn[0] != "1" || pn.start_with?("10") || pn.start_with?("11")
    if pn.length == 11 && pn.start_with?("1")
      pn = pn[1..-1]
      return nil if "10".include? pn[3]
    end
    return nil if pn.length > 10
    pn
  end

  def self.check_exchange(pn)
    index = pn.length - 7
    if "01".include?(pn[index])
      nil
    else
      pn
    end
  end

  def self.strip_non_numeric(pn)
    return nil unless pn
    digits = (0..9).map(&:to_s)
    sanitized = ""
    pn.each_char do |c|
      if digits.include?(c)
        sanitized += c
      end
    end

    sanitized
  end
end
