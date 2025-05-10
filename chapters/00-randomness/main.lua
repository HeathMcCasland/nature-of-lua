--Chapter 0 - Randomness

-- one-time setup when main.lua loads initially
function love.load()
    --width = love.graphics.getWidth() --get the screen's width when starting
    --height = love.graphics.getHeight() --get the screen's height when starting
    width, height, flags = love.window.getMode()
    local r, g, b = love.math.colorFromBytes(132, 193, 238)
    love.graphics.setBackgroundColor(r, g, b)
    x1 = (width/2)
    y1 = (height/2)
    x2 = (width/2)+100
    y2 = (height/2)+100
    walkerLine = {x1,y1, x2,y2}
    walkerIndex = 4 --if this is 2, it's a clock-walker
    drawingHasStarted = false
end

-- update underlying values every time the frame is rendered
function love.update(dt)
    if drawingHasStarted then
        x1 = x2
        y1 = y2
        x2 = x2 + math.random(-2,2)
        y2 = y2 + math.random(-2,2)
        walkerLine = Walker(walkerLine, walkerIndex, x1,y1,x2,y2)
        walkerIndex = walkerIndex + 4
    end
    drawingHasStarted = true
end

-- draw something every time the frame is rendered
function love.draw()
    --love.graphics.setColor(1,1,1)
	--love.graphics.circle('fill', 400, 300, 250)
	--love.graphics.setColor(0, 1, 1)
	--love.graphics.circle('line', 400, 300, 250)
    love.graphics.setColor(0, 0, 0)
    love.graphics.setLineWidth(1)
    love.graphics.line(walkerLine)
end

function Walker(line, index, a,b, c,d)
    table.insert(line, walkerIndex + 1, a)
    table.insert(line, walkerIndex + 1, b)
    table.insert(line, walkerIndex + 1, c)
    table.insert(line, walkerIndex + 1, d)
    return line
end