def fibs(n)
  iteration = 0
  x = 0
  y = 1
  while iteration != n do
    puts x
    z = x + y
    x = y
    y = z
    iteration += 1
  end
end

fibs 10
