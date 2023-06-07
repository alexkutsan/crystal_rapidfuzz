require "diff"

module CompareString
  def self.diff(data : String, other : String) : Float64
    return 0.0 if data.empty? && other.empty?
    small, big = data.size < other.size ? [data, other] : [other, data]
    diff = 0
    Diff.diff(small, big).each do |c|
      next if c.no_change?
      next unless str = c.data
      diff += str.size
    end
    (diff * 100) / big.size
  end
end
