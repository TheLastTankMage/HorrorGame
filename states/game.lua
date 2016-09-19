game = {}



map = {
  level0 = {}
}

function game:init()
    level0BG = love.graphics.newImage('assets/level0_background.png')
    map.level0 = sti("level/level0_map.lua", { "box2d" })

    love.physics.setMeter(16)
    world = love.physics.newWorld(0, 0)
    map.level0:box2d_init(world)

    hero:init()
end



function game:update(dt)
  hero:update(dt)
  map.level0:update(dt)
end



function game:draw()
  local scaleX = (screenWidth / 427)
  local scaleY = (screenHeight / 240)


-- Background Draw
  love.graphics.push()
      love.graphics.scale(scaleX, scaleY)
      love.graphics.draw(level0BG, 0, 0)
  love.graphics.pop()

-- Level Draw
  love.graphics.push()
      player = map.level0.layers["Hero"].player
      local tx = math.floor(mapMove.x - screenWidth / 2)
      local ty = math.floor(mapMove.y - screenHeight / 2)

      love.graphics.translate(math.floor(-tx * scaleX, -ty * scaleY))
      love.graphics.scale(scaleX, scaleY)
      map.level0:draw()

      local translateX = 427 -- Set Level Draw Range
      local translateY = 240
      map.level0:setDrawRange(translateX, translateY, screenWidth, screenHeight)
  love.graphics.pop()

-- Player Draw
  love.graphics.push()
      love.graphics.scale(scaleX, scaleY)
      hero:draw()
  love.graphics.pop()


-- COLLISION MAP DEBUG REMOVE FOR FINAL RELEASE
  love.graphics.setColor(255, 0, 0, 255)
  map.level0:box2d_draw()
  love.graphics.setColor(255, 255, 255, 255)

end



function game:keypressed(key)

end

return game
