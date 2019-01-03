require_relative '../item'

# implements Sulfuras inventory updates
class Sulfuras < BaseItem

  def update_sellin
    @sell_in
  end

  def update_quality
    80
  end

  def quality_change_amount
    0
  end

end