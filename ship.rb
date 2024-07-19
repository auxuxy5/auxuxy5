require 'ruby2d'

set background: 'aqua', title: 'Ship by Elinam Ocloo🚢'

player1 = Image.new(
  'shipYellow_manned.png',
  x: 350,
  y: 400,
  width: 50,
  height: 50,
  rotate: 0,
  z: 11,
)

# Define ship speed
ship_speed = 7

# Initialize target position
target_x = player1.x

on :key_held do |event|
  case event.key
  when 'left', 'a'
    target_x -= ship_speed
  when 'right', 'd'
    target_x += ship_speed
  when 'escape'
    close
  end
end

update do
  # Interpolate ship position towards target_x
  player1.x += (target_x - player1.x) * 0.1 # Adjust the interpolation factor (0.1) as needed

  # Prevent moving past the border
  player1.x = [player1.x, 0].max
  player1.x = [player1.x, Window.width - player1.width].min
end

show
