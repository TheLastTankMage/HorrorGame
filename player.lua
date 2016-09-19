hero = {}



function hero:init()
  layer = map.level0:addCustomLayer("Hero", 4)

-- Get Player Spawn
  player = {}
  for k, object in pairs(map.level0.objects) do
    if object.name == "Player" then
      player = object
      break
    end
  end

-- Create Player
  sprite = love.graphics.newImage("assets/player.png")
  layer.player = {
    sprite = sprite,
    x = player.x,
    y = player.y,
    w = sprite:getWidth(),
    h = sprite:getHeight(),
    ow = sprite:getWidth() / 2,
    oy = sprite:getHeight() / 1.35,
    speed = 50,
    body = love.physics.newBody(world, player.x, player.y, "dynamic"),
    dir = "right",
  }

mapMove = {
  x = layer.player.x,
  y = layer.player.y,
}

-- Hero Controls
  layer.update = function(self, dt)
    local speed = 50
      if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        self.player.x = self.player.x + speed * dt
        player.dir = "right"

      end
      if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        self.player.x = self.player.x - speed * dt
        player.dir = "left"
      end
  end


  -- HERO DRAW
  layer.draw = function(self)
    love.graphics.draw(
      self.player.sprite,
      math.floor(self.player.x),
      math.floor(self.player.y),
      0,
      1,
      1,
      self.player.ox,
      self.player.oy
    )
  end

--Remove Spawn layer
  map.level0:removeLayer("Spawn Point")

end



function hero:update(dt)

--[[
-- Map Movement
  if self.player.x >= 180 and
    love.keyboard.isDown("d") then
        mapX = mapX - speed * dt
  end

-- Player X Limit
  if self.player.x >= 180 then
    self.player.x = 180
  end
  if self.player.x <= 0 then
    self.player.x = 0
  end
]]
end

function hero:draw()

end
