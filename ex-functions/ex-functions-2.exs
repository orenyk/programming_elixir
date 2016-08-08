fizz_buzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, a -> "#{a}"
end

IO.puts "1, 2, 3 #=> " <> fizz_buzz.(1, 2, 3)
IO.puts "0, 2, 3 #=> " <> fizz_buzz.(0, 2, 3)
IO.puts "0, 0, 3 #=> " <> fizz_buzz.(0, 0, 3)

IO.puts "-----------------------------------"

fizz_buzz_2 = fn n -> fizz_buzz.(rem(n,3), rem(n,5), n) end

IO.puts "10 #=> " <> fizz_buzz_2.(10)
IO.puts "11 #=> " <> fizz_buzz_2.(11)
IO.puts "12 #=> " <> fizz_buzz_2.(12)
IO.puts "13 #=> " <> fizz_buzz_2.(13)
IO.puts "14 #=> " <> fizz_buzz_2.(14)
IO.puts "15 #=> " <> fizz_buzz_2.(15)
IO.puts "16 #=> " <> fizz_buzz_2.(16)
