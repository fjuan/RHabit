require 'test_helper'

class MealTest < ActiveSupport::TestCase
  test "by_date should includ records with desired date" do
    assert_equal([meals(:two), meals(:one)], Meal.by_date(Date.parse("2013-08-18")))
  end

  test "by_date should not include other dates" do
    assert_equal([], Meal.by_date(Date.parse("2012-01-01")))
  end

  test "summary" do
    summary = "2013-08-18 at 10:42 - snack at home: Chocolate cookies"
    assert_equal(summary, meals(:two).summary)
  end
end
