class HatosLotto < Lotto
  def url
    "http://www.szerencsejatek.hu/xls/hatos.csv"
  end

  def col_sep
    ";"
  end

  def numbers row
    row.reverse[0..5].collect {|n| n.to_i }
  end

  def date row
    row[2]
  end

  def valid? is, dt
    return false if dt.nil?
    (is.size > 2) and dt > @start_date and dt < @end_date
  end

end
