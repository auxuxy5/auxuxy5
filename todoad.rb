#TO-DO LIST! 

#Initialization Code
$hist = Array[ ]
$length = 0

def save_list_to_file(file_name)
    File.open(file_name, 'w') do |file|
      $hist.each { |item| file.puts(item) }
    end
    puts "List saved to #{file_name}!"
end


def choose_file
    puts "Enter the file name (or 'new' to create a new file):"
    file_name = gets.chomp
  
    if file_name.downcase == 'new'
      puts "Enter a new file name:"
      file_name = gets.chomp
    end
  
    file_name
end
  


# Main Loop
loop do |input|
    puts "What do you want to keep track of?"
    input = gets.chomp
  
    if input == "list"
      $hist.each_with_index { |history, index| puts "#{index + 1}) #{history}" }
    elsif input == "/xxr"
      puts "Do you want to save your list? (yes/no)"
      response = gets.chomp.downcase
      if response == "yes"
        puts "Enter the file name to save your list (or 'new' to create a new file):"
        file_name = choose_file
        save_list_to_file(file_name)
      end
      break
    else
      $hist.push(input)
    end
  end
    

#todoad.rb:35:in `block in <main>': undefined method `save_list_to_file' for main:Object (NoMethodError)

#save_list_to_file(file_name)
#^^^^^^^^^^^^^^^^^
#from todoad.rb:23:in `loop'
#from todoad.rb:23:in `<main>'