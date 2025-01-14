# frozen_string_literal: true

# Custom enumerable methods definitions
module Enumerable
  def my_each_with_index
    index = 0
    my_each do |element|
      yield(element, index)
      index += 1
    end
  end

  def my_select
    result = []
    my_each do |element|
      result << element if yield element
    end
    result
  end

  def my_all?
    my_each do |element|
      return false unless yield element
    end
    true
  end

  def my_any?
    my_each do |element|
      return true if yield element
    end
    false
  end

  def my_none?
    my_each do |element|
      return false if yield element
    end
    true
  end

  def my_count
    count = 0
    my_each do |element|
      return length unless block_given?

      count += 1 if yield element
    end
    count
  end

  def my_map
    result = []
    my_each { |element| result << yield(element) }
    result
  end

  # alias for #reduce
  def my_inject(initial_operand)
    result = initial_operand
    my_each { |element| result = yield(result, element) }
    result
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
      while i < length
        block.call(self[i])
        i += 1
      end
    end
    self
  end
end
