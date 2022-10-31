module Enumerable
  # Your code goes here
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
    self
    end
  end
end

