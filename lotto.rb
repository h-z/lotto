require 'csv'
require 'open-uri'

class Lotto

  def read_data
    filename = "lotto-" + url.split("/").last
    if File.exists?(filename)
      if File.mtime(filename) < Time.now - 7*24*60*60
        save filename
      end
    else
      save filename
    end
    @read_data ||= CSV.read(filename, :col_sep => col_sep)
  end

  def save name
    open(name, 'wb') do |file|
      file << open(url).read
    end
  end

  def url
    ""
  end

  def col_sep
    ";"
  end

  def numbers row
    row.reverse[0..4]
  end

  def date row
    row[2]
  end
  
  def show date_str
    read_data.each do |data|
      if date(data) == date_str
        return data
      end
    end
    nil
  end

  def valid? is, dt, sd, ed
    true
  end

  def winner? my_numbers, start_date, end_date
    read_data.collect do |row|
      intersect = numbers(row) & my_numbers
      dt = date(row)
      nil
      begin
        {:winner_numbers => intersect,
         :date => dt
        } if valid?(intersect, dt, start_date, end_date) 
      rescue
        nil
      end
    end.compact
  end

end
