hero = {}

tx = 0

function hero:init()

-- Get Player Spawn
  player_spawn = {}
  for k, object in pairs(map.level0.objects) do
    if object.name == "Player" then
      player_spawn = object
      break
    end
  end

-- Create Player
  player = {
    x = player_spawn.x,
    y = player_spawn.y - 32,
    img = love.graphics.newImage("assets/player.png"),
    w = 16,
    h = 32,
    ow = 16 / 2,
    oy = 32 / 1.35,
    speed = 50,
    dir = "right",
  }

--Remove Spawn layer
  map.level0:removeLayer("Spawn Point")

end



function hero:update(dt)
hero:control(dt)

-- Map Movement
  if player.x >= 180 and
    love.keyboard.isDown("d") then
        tx = tx - player.speed * dt
  end

-- Player X Limit
  if player.x >= 180 then
    player.x = 180
  end
  if player.x <= 0 then
    player.x = 0
  end


end

function hero:draw()
  love.graphics.push()
      ScreenWidthScale = love.graphics.getWidth() / scaleX
      ScreenHeightScale = love.graphics.getHeight() / scaleY

      love.graphics.translate(math.floor(tx * scaleX), 0)
      love.graphics.scale(scaleX, scaleY)
      map.level0:draw()

      local translateX = 427 -- Set Level Draw Range
      local translateY = 240
      map.level0:setDrawRange(translateX, translateY, screenWidth, screenHeight)
  love.graphics.pop()

  love.graphics.push()
      love.graphics.scale(scaleX, scaleY)
      love.graphics.draw(player.img, player.x, player.y)
  love.graphics.pop()
end


function hero:control(dt)
  if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
    player.x = player.x + player.speed * dt
    player.dir = "right"

  end
  if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
    player.x = player.x - player.speed * dt
    player.dir = "left"
  end

end
