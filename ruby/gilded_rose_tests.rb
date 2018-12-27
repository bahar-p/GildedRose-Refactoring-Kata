require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'test/unit'

class TestUntitled < Test::Unit::TestCase

  def test_name
    items = [Item.new('rice', 0, 0)]
    GildedRose.new(items).update_quality
    assert_equal items[0].name, 'rice'
  end

  # --- Regular Item --- #

  def test_regular_item_sellin_positive
    items = [Item.new('rice', 1, 2)]
    GildedRose.new(items).update_quality
    assert_equal items[0].sell_in, 0
    assert_equal items[0].quality, 1
  end

  def test_regular_item_sellin_negative
    items = [Item.new('chocolate', 0, 5)]
    GildedRose.new(items).update_quality
    assert_equal items[0].sell_in, -1
    assert_equal items[0].quality, 3
  end

  # --- Aged Brie ---- #

  def test_aged_brie_item_sellin_positive
    items = [Item.new(GildedRoseItems::AGED_BRIE, 3, 2)]
    GildedRose.new(items).update_quality
    assert_equal items[0].sell_in, 2
    assert_equal items[0].quality, 3
  end

  def test_aged_brie_item_sellin_negative
    items = [Item.new(GildedRoseItems::AGED_BRIE, 0, 2)]
    GildedRose.new(items).update_quality
    assert_equal items[0].sell_in, -1
    assert_equal items[0].quality, 4
  end

  # ---- Sulfuras ---- #

  def test_sulfuras_item_sellin_positive
    items = [Item.new(GildedRoseItems::SULFURAS, 1, 80)]
    GildedRose.new(items).update_quality
    assert_equal items[0].sell_in, 1
    assert_equal items[0].quality, 80
  end

  def test_sulfuras_item_sellin_negative
    items = [Item.new(GildedRoseItems::SULFURAS, -1, 80)]
    GildedRose.new(items).update_quality
    assert_equal items[0].sell_in, -1
    assert_equal items[0].quality, 80
  end

  # ---- Backstage concert ---- #

  def test_backstage_concert_item_sellin_more_than_ten_quality_maxed
    items = [Item.new(GildedRoseItems::BS_CONCERT, 15, 50)]
    GildedRose.new(items).update_quality
    assert_equal items[0].sell_in, 14
    assert_equal items[0].quality, 50
  end

  def test_backstage_concert_item_sellin_more_than_ten
    items = [Item.new(GildedRoseItems::BS_CONCERT, 15, 1)]
    GildedRose.new(items).update_quality
    assert_equal items[0].sell_in, 14
    assert_equal items[0].quality, 2
  end

  def test_backstage_concert_item_sellin_ten
    items = [Item.new(GildedRoseItems::BS_CONCERT, 10, 47)]
    GildedRose.new(items).update_quality
    assert_equal items[0].sell_in, 9
    assert_equal items[0].quality, 49
  end

  def test_backstage_concert_item_sellin_ten_quality_maxed
    items = [Item.new(GildedRoseItems::BS_CONCERT, 10, 49)]
    GildedRose.new(items).update_quality
    assert_equal items[0].sell_in, 9
    assert_equal items[0].quality, 50
  end

  def test_backstage_concert_item_sellin_five
    items = [Item.new(GildedRoseItems::BS_CONCERT, 5, 17)]
    GildedRose.new(items).update_quality
    assert_equal items[0].sell_in, 4
    assert_equal items[0].quality, 20
  end

  def test_backstage_concert_item_sellin_five_quality_maxed
    items = [Item.new(GildedRoseItems::BS_CONCERT, 5, 48)]
    GildedRose.new(items).update_quality
    assert_equal items[0].sell_in, 4
    assert_equal items[0].quality, 50
  end

  def test_backstage_concert_item_sellin_negative
    items = [Item.new(GildedRoseItems::BS_CONCERT, 0, 40)]
    GildedRose.new(items).update_quality
    assert_equal items[0].sell_in, -1
    assert_equal items[0].quality, 0
  end


end