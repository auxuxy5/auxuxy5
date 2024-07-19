require 'ruby2d'

# Set up the window
set title: 'Pong Game', width: 800, height: 600, background: 'white'

# Create paddles
left_paddle = Rectangle.new(x: 20, y: 250, width: 10, height: 100, color: 'green')
right_paddle = Rectangle.new(x: 770, y: 250, width: 10, height: 100, color: 'blue')

# Create the ball
ball = Circle.new(x: 400, y: 300, radius: 10, color: 'red')

# Initialize ball movement
ball_x_speed = 6
ball_y_speed = 4

# Initialize scores
left_score = 0
right_score = 0

# Create text objects for displaying scores
left_score_text = Text.new("#{left_score}", x: 20, y: 20, size: 20, color: 'green')
right_score_text = Text.new("#{right_score}", x: 700, y: 20, size: 20, color: 'blue')
total_text = Text.new(" #{left_score + right_score}", x:400, y:20, size:40, color: 'red')

# Update function for ball movement
update do
  ball.x += ball_x_speed
  ball.y += ball_y_speed

  # Bounce off top and bottom walls
  ball_y_speed *= -1 if ball.y <= 0 || ball.y >= 590

  # Bounce off paddles
  if ball.x <= left_paddle.x + left_paddle.width &&
     ball.y >= left_paddle.y && ball.y <= left_paddle.y + left_paddle.height
    ball_x_speed *= -1
  elsif ball.x >= right_paddle.x &&
        ball.y >= right_paddle.y && ball.y <= right_paddle.y + right_paddle.height
    ball_x_speed *= -1
  end

  # Check if ball goes beyond window boundaries
  if ball.x < 0
    right_score += 1
    ball.x = 400
    ball.y = 300
  elsif ball.x > 800
    left_score += 1
    ball.x = 400
    ball.y = 300
  end

  # Update score display
  left_score_text.text = " #{left_score}"
  right_score_text.text = " #{right_score}"
  total_text.text = "#{left_score + right_score} "
end

# Controls for paddles
on :key_held do |event|
  case event.key
  when 'w'
    left_paddle.y -= 6
  when 's'
    left_paddle.y += 6
  when 'up'
    right_paddle.y -= 6
  when 'down'
    right_paddle.y += 6
  when 'escape'
    close # Close the window
  end
end

# Show the window
show
