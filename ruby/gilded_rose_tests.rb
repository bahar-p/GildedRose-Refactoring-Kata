require File.join(File.dirname(__FILE__), 'gilded_rose')
Dir["#{File.dirname(__FILE__)}/items/*.rb"].each { |file| require file }
require 'test/unit'

class TestUntitled < Test::Unit::TestCase

  def test_name
    items = BaseItem.new('rice', 0, 0)
    GildedRose.new(items).update_quality
    assert_equal items.name, 'rice'
  end

  # --- Regular Item --- #

  def test_regular_item_sellin_positive
    item = BaseItem.new('rice', 1, 2)
    GildedRose.new(item).update_quality
    assert_equal item.sell_in, 0
    assert_equal item.quality, 1
  end

  def test_regular_item_sellin_negative
    items = BaseItem.new('chocolate', 0, 5)
    GildedRose.new(items).update_quality
    assert_equal items.sell_in, -1
    assert_equal items.quality, 3
  end

  # --- Aged Brie ---- #

  def test_aged_brie_item_sellin_positive
    items = AgedBrie.new(GildedRose::Items::AGED_BRIE, 3, 2)
    GildedRose.new(items).update_quality
    assert_equal items.sell_in, 2
    assert_equal items.quality, 3
  end

  def test_aged_brie_item_sellin_negative
    items = AgedBrie.new(GildedRose::Items::AGED_BRIE, 0, 2)
    GildedRose.new(items).update_quality
    assert_equal items.sell_in, -1
    assert_equal items.quality, 4
  end

  # ---- Sulfuras ---- #

  def test_sulfuras_item_sellin_positive
    items = Sulfuras.new(GildedRose::Items::SULFURAS, 1, 80)
    GildedRose.new(items).update_quality
    assert_equal items.sell_in, 1
    assert_equal items.quality, 80
  end

  def test_sulfuras_item_sellin_negative
    items = Sulfuras.new(GildedRose::Items::SULFURAS, -1, 80)
    GildedRose.new(items).update_quality
    assert_equal items.sell_in, -1
    assert_equal items.quality, 80
  end

  # ---- Backstage concert ---- #

  def test_backstage_concert_item_sellin_more_than_ten_quality_maxed
    items = BackStageConcert.new(GildedRose::Items::BS_CONCERT, 15, 50)
    GildedRose.new(items).update_quality
    assert_equal items.sell_in, 14
    assert_equal items.quality, 50
  end

  def test_backstage_concert_item_sellin_more_than_ten
    items = BackStageConcert.new(GildedRose::Items::BS_CONCERT, 15, 1)
    GildedRose.new(items).update_quality
    assert_equal items.sell_in, 14
    assert_equal items.quality, 2
  end

  def test_backstage_concert_item_sellin_ten
    items = BackStageConcert.new(GildedRose::Items::BS_CONCERT, 10, 47)
    GildedRose.new(items).update_quality
    assert_equal items.sell_in, 9
    assert_equal items.quality, 49
  end

  def test_backstage_concert_item_sellin_ten_quality_maxed
    items = BackStageConcert.new(GildedRose::Items::BS_CONCERT, 10, 49)
    GildedRose.new(items).update_quality
    assert_equal items.sell_in, 9
    assert_equal items.quality, 50
  end

  def test_backstage_concert_item_sellin_five
    items = BackStageConcert.new(GildedRose::Items::BS_CONCERT, 5, 17)
    GildedRose.new(items).update_quality
    assert_equal items.sell_in, 4
    assert_equal items.quality, 20
  end

  def test_backstage_concert_item_sellin_five_quality_maxed
    items = BackStageConcert.new(GildedRose::Items::BS_CONCERT, 5, 48)
    GildedRose.new(items).update_quality
    assert_equal items.sell_in, 4
    assert_equal items.quality, 50
  end

  def test_backstage_concert_item_sellin_negative
    items = BackStageConcert.new(GildedRose::Items::BS_CONCERT, 0, 40)
    GildedRose.new(items).update_quality
    assert_equal items.sell_in, -1
    assert_equal items.quality, 0
  end

  # ---- Conjured item ---- #

  def test_conjured_item_sellin_positive
    items = Conjured.new('conjured cake', 10, 15)
    GildedRose.new(items).update_quality
    assert_equal items.sell_in, 9
    assert_equal items.quality, 13
  end

  def test_conjured_item_sellin_negative
    items = Conjured.new('conjured cake', 0, 15)
    GildedRose.new(items).update_quality
    assert_equal items.sell_in, -1
    assert_equal items.quality, 11
  end

end