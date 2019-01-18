
# implements Aged Brie inventory updates
class AgedBrie < BaseItem

  def update_quality
    updated_quality = @quality + quality_change_amount
    @quality = updated_quality > 50 ? 50 : updated_quality
  end

end