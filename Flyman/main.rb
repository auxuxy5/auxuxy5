require 'ruby2d'

set width: 640
set height: 480
gravity = 3
space = 0


Image.new('background.png')



sprite = Sprite.new(
  'character.png',
  x: 100,
  y: 200,
  clip_width: 60,
  animations: { fly: 1..3 }
)

sound = Sound.new('jump.ogg')

music = Music.new("soundtrack.ogg", loop: true )

  
music.play

Text.new(
  'My Ruby 2D Game',
  x: 180,
  y: 10,
  size: 42,
  color: 'black'
)

ptext = Text.new(
  '',
  x: 100,
  y: 10,
  size: 42,
  color: 'black'
)

on :key_held do |event|
  sprite.play(animation: :fly)

  case event.key
  when 'up'
    sprite.y -= 7
  when 'down'
    sprite.y += 6
  when 'left'
    sprite.x -= 6
  when 'right'
    sprite.x += 6
  when 'w'
    sprite.y -=7
  when 's'
    sprite.y += 6
  when 'a'
    sprite.x -= 6
  when 'd'
    sprite.x += 6
  when 'escape'
    close
  end
end

on :key_up do
  sprite.stop
end

on :key_down do |event|
  case event.key
  when 'space'
    if space == 1
      space = 0
    else
      space = 1
    end
  end
end

update do
  unless space == 1
    sprite.y += gravity
    if sprite.y > 420
      close
    elsif sprite.y < 0
      close
    elsif sprite.x > 620
      close
    elsif sprite.x < 0
      close
    end
  end
  if space == 0
    music.resume
    ptext.text = ""
  else
    music.pause
    ptext.text = "| |"
  end
end

on :key_down do
  sound.play
end

show