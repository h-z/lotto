require './lotto.rb'

class SkandiLotto < Lotto
  def url
    "http://www.szerencsejatek.hu/xls/skandi.csv"
  end

  def col_sep
    ";"
  end

  def numbers row
    row.reverse[0..13].collect {|n| n.to_i }
  end

  def date row
    row[2]
  end

  def valid? is, dt, start_date, end_date
    #p [is.size, dt, start_date, end_date] unless dt.nil?
    return false if dt.nil?
    (is.size > 3) and dt > start_date and dt < end_date
  end

end


s = SkandiLotto.new 
p s.winner? [1,2,3,4,5,81, 82, 83, 84, 85, 86, 22,33,44,55,66,12,43,32], "2012.04.04.", "2012.07.23."
