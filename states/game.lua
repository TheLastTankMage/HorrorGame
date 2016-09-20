game = {}



map = {
  level0 = {}
}

function game:init()
    level0BG = love.graphics.newImage('assets/level0_background.png')
    map.level0 = sti("level/level0_map.lua", { "box2d" })

    hero:init()
end



function game:update(dt)
  hero:update(dt)
  map.level0:update(dt)
end



function game:draw()
  scaleX = (screenWidth / 427)
  scaleY = (screenHeight / 240)


-- Background Draw
  love.graphics.push()
      love.graphics.scale(scaleX, scaleY)
      love.graphics.draw(level0BG, 0, 0)
  love.graphics.pop()


-- Player/Level Draw
      hero:draw()



--[[ COLLISION MAP DEBUG REMOVE FOR FINAL RELEASE
  love.graphics.setColor(255, 0, 0, 255)
  map.level0:box2d_draw()
  love.graphics.setColor(255, 255, 255, 255)
]]
end



function game:keypressed(key)

end

return game
