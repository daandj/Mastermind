class Array
  def deep_dup
    map { |x| x.deep_dup }
  end
end

class Object
  def deep_dup
    dup
  end
end

class Numeric
  def deep_dup
    self
  end
end
