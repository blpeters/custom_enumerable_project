# frozen_string_literal: true

# Custom enumerable methods definitions
module Enumerable
  def my_each_with_index
    index = 0
    self.my_each do |element|
      yield(element, index)
      index += 1
    end
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each(&block)
    if block_given?
      i = 0
      while i < self.length
        block.call(self[i])
        i += 1
      end
    end
    self
  end
end
