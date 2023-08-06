class Triangle
  def initialize(sides)
    raise "Three sides to a triangle." unless sides.length == 3
    @a, @b, @c = sides.sort()
  end

  def equilateral?
    valid? and (@a == @b and @b == @c)
  end

  def isosceles?
    valid? and (@a == @b or @b == @c or @a == @c)
  end

  def scalene?
    valid? and (@a != @b and @b != @c and @a != @c)
  end

  private

  def triangle_inequality_satisfied?
    @a + @b >= @c and
      @b + @c >= @a and
      @a + @c >= @b
  end

  def nonzero?
    @a > 0 and @b > 0 and @c > 0 
  end

  def valid?
    triangle_inequality_satisfied? and nonzero?
  end
end
