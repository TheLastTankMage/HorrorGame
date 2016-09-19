debug = true

require("player")

-- HUMP Libraries
gamestate = require("gamestate")
timer = require("timer")

-- STI Tiled Loader
sti = require("sti")

-- Bump Collider
bump = require("bump")

-- Game States
splashA = require("states.splashA")
splashB = require("states.splashB")
menu = require("states.menu")
game = require("states.game")

-- GLOBAL VARIABLES
loveLogo = nil
color = {alpha = 255}

screenWidth, screenHeight = love.graphics.getWidth(), love.graphics.getHeight()
sw, sh = screenWidth, screenHeight

love.graphics.setDefaultFilter("nearest", "nearest")


function love.load(arg)

-- START GAMESTATES
  gamestate.registerEvents()
  gamestate.switch(splashA)
  game:init()

-- LOAD IMAGES
    loveLogo = love.graphics.newImage('assets/love_logo.png')
    testLogo = love.graphics.newImage('assets/test_logo.png')

end


function love.update(dt)
  timer.update(dt)

  if love.keyboard.isDown('escape') then
    love.event.quit()
  end

end


function love.draw()

end
