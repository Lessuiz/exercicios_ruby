puts "Coloque um número"
numero = gets.chomp.to_i

def contagem_regressiva(x)
  if x == 1
    0
  else
    puts x - 1
    contagem_regressiva(x - 1)
  end
end

contagem_regressiva(numero)
