module ApplicationHelper
  def group(list, num)
    result = []
    g = []
    list.each_with_index do |item, i|
      if i%num === 0
        if g.length > 0
          result << g
        end
        g = []
      end
      g << item
    end
    if g.length > 0
      result << g
    end
    return result
  end
end
