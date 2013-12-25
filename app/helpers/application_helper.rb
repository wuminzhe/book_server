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

  def append_params(url, params)
    useful_params = {}
    params.each do |k, v|
      if not v.blank?
        useful_params[k] = v
      end
    end

    #
    query_string_arr = []
    useful_params.each do |k, v|
      query_string_arr << "#{k}=#{v}"
    end
    query_string = query_string_arr.join('&')

    #
    segs = url.split('?')
    if segs.length==1
      return "#{segs[0]}?#{query_string}"
    elsif segs.length==2
      return "#{url}&#{query_string}"
    end

  end

  
end
