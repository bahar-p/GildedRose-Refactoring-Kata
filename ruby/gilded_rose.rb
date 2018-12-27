# frozen_string_literal: true #not gonna work because they use ruby v2.3.3

require_relative 'item'
require_relative 'gilded_rose_items'

# implements Gilded Rose inventory
class GildedRose

  # @param items [Array<Item>] array of items
  def initialize(items)
    @items = items
  end

  # update items quality
  def update_quality
    @items.each do |item|
      item.sell_in = item.sell_in - 1 unless item.name == GildedRoseItems::SULFURAS
      degrade_factor = (item.sell_in < 0 || item.name.match(GildedRoseItems::CONJURED) ? 2 : 1)

      if item.name != GildedRoseItems::AGED_BRIE && item.name != GildedRoseItems::BS_CONCERT && \
         item.name != GildedRoseItems::SULFURAS
        regular_item(item, degrade_factor)
      else
        special_item(item, degrade_factor)
      end
    end
  end


  @private

  # update quality of a regular item
  # @param item [Item] store item
  # @param factor [Object] factor by which item's quality is updated
  def regular_item(item, factor)
    item.quality = item.quality - factor unless item.quality.zero?
  end

  # update quality of a special item
  # @param item [Item] store item
  # @param factor [Object] factor by which item's quality is updated
  def special_item(item, factor)
    item.quality = item.quality + factor unless item.quality == 50 || item.name == GildedRoseItems::SULFURAS
    # backstage concert
    if item.name == GildedRoseItems::BS_CONCERT && (item.quality + factor) <= 50
      item.quality = item.quality + factor if item.sell_in <= 10
      item.quality = item.quality + factor if item.sell_in <= 5 && (item.quality + factor) <= 50
      item.quality = 0 if item.sell_in <= 0
    end
  end

end