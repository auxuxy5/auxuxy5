require 'ruby2d'
def mainGame
  score = 0
  
  set width: 800, height: 400
  music = Music.new("retro-change-203147.mp3", loop:true)
  music.play
  player = Square.new(
    x: 100,
    y: 100,
    size: 50,
    color: 'blue',
    z: 3
  )

  scorenow = Text.new(
    '',
    x: 400,
    y: 10
  )

  object = Square.new(
    x: 10,
    y: 100,
    size: 50,
    color: 'red',
    z: 2
  )

  radius = Line.new(
    width: 9
  )

  projectiles = []
  update do
    # Move projectiles downwards
    projectiles.each do |proj|
      proj.y += 5
      if proj.y > Window.height
        proj.remove
        projectiles.delete(proj)
      end
    end


    # Check for collisions
    projectiles.each do |proj|
      if proj.contains?(player.x, player.y) || proj.contains?(player.x + player.size, player.y) ||
         proj.contains?(player.x, player.y + player.size) || proj.contains?(player.x + player.size, player.y + player.size)
        close
      elsif proj.contains?(object.x, object.y) || proj.contains?(object.x + object.size, object.y) ||
            proj.contains?(object.x, object.y + object.size) || proj.contains?(object.x + object.size, object.y + object.size)
        close
      end
    end

    # Add new projectiles
    if rand < 0.05
      projectiles << Square.new(
        x: rand(Window.width),
        y: 0,
        size: 20,
        color: 'green',
        z: 1
      )
    end

    # Radius logic
    if player.x - object.x > Window.width / 3
      close
    elsif player.y - object.y > Window.height / 2
      close
      
    elsif object.y - player.y > Window.height / 2
      close
    elsif object.x - player.x > Window.width / 3
      close
    elsif object.x - player.x > Window.width / 3 - 70
      radius.color = 'orange'
    elsif object.y - player.y > Window.height / 2 - 70
      radius.color = 'orange'
    elsif player.x - object.x > Window.width / 3 - 70
      radius.color = 'orange'
    elsif player.y - object.y > Window.height / 2 - 70
      radius.color = 'orange'
    else
      radius.color = 'white'
    end

    radius.x2 = object.x + 10
    radius.y2 = object.y + 10
    radius.x1 = player.x + 10
    radius.y1 = player.y + 10

    score += 1
    scorenow.text = score
  end

  on :key_held do |event|
    case event.key
    when 'right'
      player.x += 5
    when 'left'
      player.x -= 5
    when 'up'
      player.y -= 5
    when 'down'
      player.y += 5
    when 'd'
      object.x += 5
    when 'a'
      object.x -= 5
    when 'w'
      object.y -= 5
    when 's'
      object.y += 5
    end
  end

  click = 0

  on :key_down do |event|
    if event.key == 'm'
      if click == 0
        click = 1
        music.volume = 0
      else
        click = 0
        music.volume = 100
      end
    end
  end
end



mainGame

show