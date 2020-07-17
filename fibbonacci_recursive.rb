def fibs_rec(n)
  return 1 if n == 1 || n == 0
  fibs_rec(n-1) + fibs_rec(n-2)
end

puts fibs_rec(10)
