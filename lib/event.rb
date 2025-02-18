class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    food_trucks_with_item = []
    @food_trucks.each do |food_truck|
      food_truck.inventory.find_all do |check_inventory|
        food_trucks_with_item << food_truck if check_inventory.include?(item)
      end
    end
    food_trucks_with_item
  end

  def total_inventory
    item_values = Hash.new
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        item_values[item] = {quantity: food_truck.inventory, food_trucks: food_trucks_that_sell(item)}
      end
    end
    item_values
  end
end
