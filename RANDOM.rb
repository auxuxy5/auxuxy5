
$list = Array[]



100.times do
  inp = rand(1..100)
  $list.push(inp)
  puts inp
end


puts "Your random number is #{$list[rand(1..100)].to_s}"