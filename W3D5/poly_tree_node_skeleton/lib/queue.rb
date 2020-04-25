class Queue

  def initialize
    @array = []
  end

  def enqueu(el)
    @array.push(el)
    self
  end

  def dequeue #remove from front of line
    @array.shift
  end

  def peek
    @array.first
  end

end