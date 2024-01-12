module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    for item in self
      yield(item, index)
      index += 1
    end
  end

  def my_select
    new_array = []
    for item in self
      new_array.push(item) if yield(item)
    end
    new_array
  end

  def my_all?
    all_true = true
    for item in self
      all_true = false unless yield(item)
    end
    all_true
  end

  def my_any?
    any_true = false
    for item in self
      any_true = true if yield(item)
    end
    any_true
  end

  def my_none?
    none_true = true
    for item in self
      none_true = false if yield(item)
    end
    none_true
  end

  def my_count
    count = 0
    for item in self
      count += 1 if yield(item)
    end
    count
  end

  def my_map
    new_array = []
    for item in self
      new_array.push(yield(item))
    end
    new_array
  end

  def my_inject(initial_value)
    total = yield(initial_value, self[0])
    i = 0
    while i < self.length - 1
      total = yield(total, self[i + 1])
      i += 1
    end
    total
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for item in self
      yield(item)
    end
  end
end

class Hash
  def my_each
    for item in self
      yield(item)
    end
  end
end
