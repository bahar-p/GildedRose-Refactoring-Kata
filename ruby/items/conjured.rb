require_relative '../item'

# implements base item inventory updates, including conjured
class Conjured < BaseItem

  def quality_change_amount
    @sell_in < 0 ? 4 : 2
  end

end