defmodule MyList do
  def mapsum([], _fun), do: 0

  def mapsum([h|t], fun) do 
     fun.(h) + mapsum(t, fun)
  end

  def max([]), do: 0

  def max([x,y]) when x > y, do: x

  def max([x,y]) when x <= y, do: y

  def max([head|tail]) do 
    max([head, max(tail)])
  end
  

  def caesar([], _n), do: []

  def caesar([head|tail], n) do
	[26+rem(head+n, 26), caesar(tail, n)]
  end

  def span(from, from), do: [from]

  def span(from, to) do 
    [from | span(from+1, to)]
  end
	
	def a()

end
