require "./rapidfuzz"
require "benchmark"
require "./compare_diff"

def modify_percent(input_str : String, percent : Int32) : String
  output_str = ""
  alphabet = ('a'..'z').to_a
  input_str.chars.each do |char|
    output_str +=  Random.rand(100) > percent ? char : alphabet.sample
  end
  output_str
end


def generate_random_string(size : Int) : String
    random = Random.new
    chars = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a + [' ', "\n"]
    random_string = String.build(size) do |str|
      size.times do
        str << chars.sample
      end
    end
    random_string
  end
  

# puts generate_random_string(1000)

string_sizes = [100, 5000, 20000,100000]
percent_differences = [0, 2, 10, 90, 100]
string_sizes.each do |size|
  percent_differences.each do |percent|
    str1 = generate_random_string(size)
    str2 = modify_percent(str1, percent)

    Benchmark.ips do |x|
        x.report("diff on string size #{size} percent diff #{percent}") { CompareString.diff(str1, str2) }
        x.report("rapidfuzz on string size #{size} percent diff #{percent}") { Rapidfuzz.ratio(str1, str2) }
    end
  end  
end
