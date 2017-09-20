require 'test_helper'

class CurrencyCoderTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::CurrencyCoder::VERSION
  end

  def test_as_currency_code
    cc = CurrencyCoder.new

    currency_map = {
      "osamu"    => "OSM",
      "mayoto"   => "MYT",
      "kurotaki" => "KRT",
      "putchom"  => "PTM",
      "antipop"  => "ATP",
      "jitsuzon" => "JZN"
    }

    currency_map.each do |name, code|
      assert_equal code, cc.as_currency_code(name)
    end
  end
end
