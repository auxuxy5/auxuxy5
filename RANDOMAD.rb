
$list = Array[]
$list1 = Array[]
$list2 = Array[]

puts "STAGE1"
100.times do
  inp = rand(1..100)
  $list.push(inp)
  puts inp
end

puts "STAGE2"
200.times do
  inp = rand(1..200)
  $list1.push(inp)
  puts inp
end

puts "STAGE3"
300.times do
  inp = rand(1..300)
  $list2.push(inp)
  puts inp
end
puts "The random numbers are #{$list[rand(0..100)].to_s}, #{$list1[rand(0..200)].to_s}, and #{$list2[rand(0..300)].to_s}"