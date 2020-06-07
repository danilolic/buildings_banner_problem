# frozen_string_literal: true

require 'pry'

require_relative 'buildings_calculator'
require_relative 'banners_calculator'

def solution(h)
  @buildings_calculator = Buildings::Calculator.new(h)
  @banners_calculator = Banners::Calculator.new(@buildings_calculator)

  cost_of_single_banner = @banners_calculator.cost_of_single_banner
  cost_for_two_banners = @banners_calculator.lowest_cost_for_two_banners

  return cost_of_single_banner if cost_of_single_banner < cost_for_two_banners

  cost_for_two_banners
end

puts solution([5, 3, 2, 4])               == 17
puts solution([7, 7, 3, 7, 7])            == 35
puts solution([5, 3, 5, 2, 1])            == 19
puts solution([3, 1, 4])                  == 10
puts solution([3, 5, 7, 5, 10, 5, 3, 5])  == 65
puts solution([1, 1, 7, 6, 6, 6])         == 30
