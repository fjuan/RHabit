require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  test "by_date should includ records with desired date" do
    assert_equal([payments(:one)], Payment.by_date(Date.parse("2013-08-17")))
  end

  test "by_date should not include other dates" do
    assert_equal([], Payment.by_date(Date.parse("2012-01-01")))
  end

  test "summary" do
    summary = "2013-08-17 at 10:35 - 1.5 (cash) on fruits"
    assert_equal(summary, payments(:one).summary)
  end

  test "date" do
    assert_equal(Date.new(2013,8,17), payments(:one).date)
  end
end
