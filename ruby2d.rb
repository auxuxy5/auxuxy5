# Install the Ruby2D gem: gem install ruby2d
require 'ruby2d'

# Set up the game window
set background: 'navy'
set fps_cap: 20
GRID_SIZE = 20
GRID_WIDTH = Window.width / GRID_SIZE
GRID_HEIGHT = Window.height / GRID_SIZE

# Snake class
class Snake
  attr_writer :direction
  attr_reader :positions

  def initialize
    @positions = [[2, 0], [2, 1], [2, 2], [2, 3]]
    @direction = 'down'
    @growing = false
  end

  def draw
    @positions.each do |position|
      Square.new(x: position[0] * GRID_SIZE, y: position[1] * GRID_SIZE, size: GRID_SIZE - 1, color: 'red', z: 10)
    end
  end

  def move
    @positions.shift unless @growing

    case @direction
    when 'down' then @positions.push(new_coords(head[0], head[1] + 1))
    when 'up' then @positions.push(new_coords(head[0], head[1] - 1))
    when 'left' then @positions.push(new_coords(head[0] - 1, head[1]))
    when 'right' then @positions.push(new_coords(head[0] + 1, head[1]))
    end

    @growing = false
  end

  def can_change_direction_to?(new_direction)
    case @direction
    when 'up' then new_direction != 'down'
    when 'down' then new_direction != 'up'
    when 'left' then new_direction != 'right'
    when 'right' then new_direction != 'left'
    end
  end

  def grow
    @growing = true
  end

  def snake_hit_itself?
    @positions.uniq.length != @positions.length
  end

  private

  def new_coords(x, y)
    [x % GRID_WIDTH, y % GRID_HEIGHT]
  end

  def head
    @positions.last
  end
end

# Create a snake and set its initial direction
snake = Snake.new
snake.direction = 'down'

# Main game loop
update do
  snake.move
  close if snake.snake_hit_itself?
end

# Keyboard input to change snake direction
on :key_down do |event|
  new_direction = event.key
  snake.direction = new_direction if snake.can_change_direction_to?(new_direction)
end

# Show the game window
show
