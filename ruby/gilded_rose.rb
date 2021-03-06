# frozen_string_literal: true #not gonna work because they use ruby v2.3.3

require_relative 'item'

# implements Gilded Rose inventory
class GildedRose

  # @param items [Array<Item>] array of items
  def initialize(items)
    @items = Array(items)
  end

  # TODO: move update_sellin to update quality method of each item and rename to update_sellin_and_quality
  # update items quality
  def update_quality
    @items.each do |item|
      item.update_sellin
      item.update_quality
    end
  end

  # move names to each item class
  module Items
    AGED_BRIE = 'Aged Brie'.freeze
    BS_CONCERT = 'Backstage passes to a TAFKAL80ETC concert'.freeze
    SULFURAS = 'Sulfuras, Hand of Ragnaros'.freeze
  end

end