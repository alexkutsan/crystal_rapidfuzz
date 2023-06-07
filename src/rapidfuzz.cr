# TODO: Write documentation for `Rapidfuzz`
module Rapidfuzz
  extend self
  VERSION = "0.1.0"
  @[Link(ldflags: "-L#{__DIR__}/.. -lRapidFuzzCrystalWrapper --static -lstdc++")]
  lib RapidFuzzCrystalWrapper
    fun ratio(left : LibC::Char*, right : LibC::Char*) : Float64
  end

  def ratio(str1 : String, str2 : String) : Float64
    result = RapidFuzzCrystalWrapper.ratio(str1.to_unsafe, str2.to_unsafe)
    result
  end
end
