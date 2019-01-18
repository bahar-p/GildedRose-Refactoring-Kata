
# implements base item inventory updates, including conjured
class BaseItem < Item

  def update_sellin
    @sell_in -= 1
  end

  def update_quality
    updated_quality = @quality - quality_change_amount
    @quality = updated_quality < 0 ? 0 : updated_quality
  end

  def quality_change_amount
    @sell_in < 0 ? 2 : 1
  end

end