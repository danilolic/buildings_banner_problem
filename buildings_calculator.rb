# frozen_string_literal: true

module Buildings
  ##
  # A helper to operate under the buildings list
  class Calculator
    attr_reader :max_height, :index_max_height, :width

    def initialize(buildings)
      @buildings = buildings
      @width = buildings.length
      @max_height = buildings.max
      @index_max_height = buildings.find_index(@max_height)
    end

    ##
    # Redefine @index_max_height if the max global is duplicated
    # Return true if the max global is the first element
    def max_is_first?
      @index_max_height = build_new_index if first_max_is_duplicated?

      @index_max_height.zero?
    end

    ##
    # Return true if the max global is the last element
    def max_is_last?
      @buildings.index(@buildings.last) == @index_max_height
    end

    ##
    # Get the index of the global element and
    # Return the width of the subarray on the left of the max global element, excluding him.
    def left_width
      @buildings[0...@index_max_height].length
    end

    ##
    # Get the index of the global element and
    # Return the width of the subarray on the right of the max global element, excluding him.
    def right_width
      @buildings[(@index_max_height + 1)..-1].length
    end

    ##
    # Get the index of the max global element and
    # Return the max element on the left of the max global element
    def max_left
      @buildings[0...@index_max_height].max
    end

    ##
    # Get the index of the max global element and
    # Return the max element on the right of the max global element
    def max_right
      @buildings[(@index_max_height + 1)..-1].max
    end

    private

    ##
    # Verify if max global is first and is duplicated
    def first_max_is_duplicated?
      @index_max_height.zero? && @buildings[1..-1].max == @max_height
    end

    ##
    # Search for a new index to max global excluding the first element
    def build_new_index
      @buildings[1..-1].find_index(@max_height) + 1
    end
  end
end
