require 'test_helper'

class ScopeTest < Minitest::Test
  def test_strict_near_performs_like_near_on_good_input
    assert Address.send(:near!, "New York, NY").to_sql
  end

  def test_if_remote_geo_lookup_fails_with_address_then_raise_invlaid_location
    assert_raises StrictGeocoder::InvalidLocation do
      Address.send(:near!, [1,1,1,1,1]).to_sql
    end
  end
end
