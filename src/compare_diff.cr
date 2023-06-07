require "diff"

module CompareString
  def self.diff(data : String, other : String) : Float64
    return 0.0 if data.empty? && other.empty?
    if data.size < other.size
      small, big = data, other
    else 
      small, big = other, data
    end
    diff = 0
    Diff.diff(small, big).each do |c|
      next if c.no_change?
      if str = c.data
        diff += str.size
      end
    end
    (diff * 100) / big.size
  end
end
