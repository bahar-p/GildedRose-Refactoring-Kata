require_relative '../item'

# implements Backstage Concert inventory updates
class BackStageConcert < BaseItem

  def update_quality
    updated_quality = @quality + quality_change_amount
    @quality = updated_quality > 50 ? 50 : updated_quality
  end

  def quality_change_amount
    if sell_in < 0
      -(@quality)
    elsif sell_in <= 5
      3
    elsif sell_in <= 10
      2
    else
      1
    end
  end

end

