# frozen_string_literal: true

module Banners
  ##
  # Given some informations about the buildings
  # Get the costs for one/two banners
  class Calculator
    def initialize(buildings_calculator)
      @buildings_calculator = buildings_calculator
    end

    ##
    # Get the number of buildings and the biggest height and
    # return the cost to a single banner
    def cost_of_single_banner
      @buildings_calculator.width * @buildings_calculator.max_height
    end

    ##
    # Return the lowest cost for two banners
    # 1.When the biggest building is the first element
    # 2.When the biggest building is the last element
    # 3.when the biggest building is between the first and last element
    def lowest_cost_for_two_banners
      if @buildings_calculator.max_is_first?
        cost_of_two_banners_when_max_is_the_first
      elsif @buildings_calculator.max_is_last?
        cost_of_two_banners_when_max_is_the_last
      else
        cost_of_two_banners
      end
    end

    private

    ##
    # For two banners
    # 3.when the biggest building is between the first and last element
    # calculates the max element of the subarrays on the left side and right side of the max global
    # The max global belongs to the side with biggest max local
    # return the lowest cost
    def cost_of_two_banners
      if @buildings_calculator.max_left >= @buildings_calculator.max_right
        cost_with_max_global_in_left_side
      else
        cost_with_max_global_in_right_side
      end
    end

    ##
    # puts the max global on the left side and return the cost
    def cost_with_max_global_in_left_side
      (@buildings_calculator.max_height * (@buildings_calculator.left_width + 1)) +
        (@buildings_calculator.max_right * @buildings_calculator.right_width)
    end

    ##
    # puts the max global on the right side and return the cost
    def cost_with_max_global_in_right_side
      (@buildings_calculator.max_left * @buildings_calculator.left_width) +
        (@buildings_calculator.max_height * (@buildings_calculator.right_width + 1))
    end

    ##
    # For two banners
    # Return the cost when the global height is the first element
    def cost_of_two_banners_when_max_is_the_first
      (@buildings_calculator.max_height * 1) +
        (@buildings_calculator.max_right * (@buildings_calculator.width - 1))
    end

    ##
    # For two banners
    # Return the cost when the global height is the last element
    def cost_of_two_banners_when_max_is_the_last
      (@buildings_calculator.max_height * 1) +
        (@buildings_calculator.max_left * (@buildings_calculator.width - 1))
    end
  end
end
