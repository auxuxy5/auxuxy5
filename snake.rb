require "ruby2d"



#SNAKE GAME
puts "starting snake...🐍"


#INITIALIZATION CODE
set title: 'Snake by Elinam Ocloo 🐍', background: 'navy'

#width of window = 640(by default) 
#height of window = 480(by default)

GRID_SIZE = 20
GRID_WIDTH = Window.width / GRID_SIZE
GRID_HEIGHT = Window.height / GRID_SIZE

set fps_cap: 14


#SNAKE CLASS(WHERE ALL THE FUNCTIONS AND BLOCKS FOR THE SNAKE ARE CREATED )
class Snake
    attr_writer :directions
    
    def initialize
        @positions = [[2,0], [2,1], [2,2], [2,3]]
        @directions = 'down'
        @growing = false
    end

    def draw #DRAWS UP THE SNAKE
        @positions.each do |position|
            Square.new(
                x: position[0] * GRID_SIZE, 
                y: position[1] * GRID_SIZE, 
                size: GRID_SIZE - 1, 
                color: 'orange'
            )
        end
    end

    def move #ALLOWS THE SNAKE TO MOVE
        if !@growing
            @positions.shift
        end
        case @directions
        when 'down'
            @positions.push(new_coords(head[0], head[1] + 1))
        when 'up'
            @positions.push(new_coords(head[0], head[1] - 1))
        when 'left'
            @positions.push(new_coords(head[0] - 1, head[1]))
        when 'right'
            @positions.push(new_coords(head[0] + 1, head[1]))
        end
        @growing = false
    end

    def can_change_dir?(new_dir)#HANDLES SIMPLE FIXES SUCH AS THE SNAKE MOVING IN ON ITSELF
        case @directions
        when 'up' then new_dir != 'down'
        when 'down' then new_dir != 'up'
        when 'left' then new_dir != 'right'
        when 'right' then new_dir != 'left'
        end
    end
    
    def x 
        head[0]
    end

    def y 
        head[1]
    end

    def grow
        @growing = true
    end

    def hit_itself
        @positions.uniq.length != @positions.length
    end

    def direct
        @directions
    end
    private 

    def new_coords(x, y)
        [x % GRID_WIDTH, y % GRID_HEIGHT]
    end

    

    def head#DEFINES WHERE OUR HEAD(STARTING POINT) IS.
        @positions.last
    end
    
end

class Game
    def initialize
      @score = 0
      @ball_x = rand(GRID_WIDTH)
      @ball_y = rand(GRID_HEIGHT)
      @finished = false
    end
    def draw #DRAWS UP THE SNAKE
        unless finished?
            Square.new(
                x: @ball_x * GRID_SIZE, 
                y: @ball_y * GRID_SIZE, 
                size: GRID_SIZE, 
                color: 'white'
            )
        end
        Text.new(
            text_message,
            color: 'white',
            size: 25,
            x: 10,
            y: 10
        )
       
    end

    def snake_hit_ball(x, y)
        @ball_x == x and @ball_y == y
    end

    def finish
        @finished = true
    end

    def finished?
        @finished
    end

    def record_hit
        @score = @score + 1
        @ball_x = rand(GRID_WIDTH)
        @ball_y = rand(GRID_HEIGHT)
    end

    private

    def text_message
        if finished?
            "Game Over, your score was #{@score}. Press 'r' to restart"
        else
            "#{@score}"
        end
    end
end

#WE CREATE OUR SNAKE
snake = Snake.new
game = Game.new




#UPDATE EACH FRAME
update do
    clear
    unless game.finished?
        snake.move
    end
    snake.draw
    game.draw
    if game.snake_hit_ball(snake.x, snake.y)
        game.record_hit
        snake.grow
    end
    if snake.x == 31 || snake.x == 0
        
        if snake.direct != 'up' && snake.direct != 'down'
            game.finish
        end
    elsif snake.y == 23 || snake.y == 0
        
        if snake.direct != 'left' && snake.direct != 'right'
            game.finish
        end
    end
    if snake.hit_itself
        game.finish
    end
end
#HANDLES KEY INPUT
on :key_down do |event|
    if ['down', 'up', 'left', 'right'].include?(event.key)
        if snake.can_change_dir?(event.key)
            snake.directions = event.key
        end
    elsif 'escape'.include?(event.key)
        close
    elsif 'r'.include?(event.key)
        snake = Snake.new
        game = Game.new
    end
end

#SHOWS THE WINDOW
show 