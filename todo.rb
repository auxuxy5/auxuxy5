

#TO-DO LIST! 

#Initialization Code
$hist = Array[ ]
$length = 0

#Main Loop
loop do |input|
    puts "What do you want to keep track of?"
    input = gets.chomp
    
    #Reader and List Tracker
    if input == "list"
        for history in $hist
            $length = $length + 1
            puts "#{$length}) #{history}"
        end
        $length = 0
    elsif input == "end"
        break
    else 
        $hist.push(input)
    end
end