class FoodTruck
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    if @inventory.include?(item)
      inventory[item]
    else !@inventory.include?(item)
      0
    end
  end

  def stock(item, amount)
    inventory[item] += amount
  end
end
