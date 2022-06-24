--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]
-- Source for the rank pictures
-- iron: https://thegamingauction.com/product/iron-rank-full-account-access-character-of-your-choice-na-account/
-- platinum: https://valorant.fandom.com/wiki/Competitive
-- immortal: https://zeusx.com/Valorant/euoreurope-immortal-ranked-account-or-random-specification-or-full-access-and-changeable-or-valorant-154085

ScoreState = Class{__includes = BaseState}
local iron = love.graphics.newImage('iron (1).png')
local platinum = love.graphics.newImage('platinum (1).png')
local immortal = love.graphics.newImage('immortal (1).png')



--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    if self.score >=3 and self.score < 5 then
       
        love.graphics.draw(iron, VIRTUAL_WIDTH/2 - 40, 110, 0, 0.27, 0.27)
        
    elseif self.score >=5 and self.score < 10 then
        love.graphics.draw(platinum, VIRTUAL_WIDTH/2 - 40, 117, 0, 0.27, 0.27)
    elseif self.score >= 10 then
        love.graphics.draw(immortal, VIRTUAL_WIDTH/2 - 40, 117, 0, 0.27, 0.27)
    end


    love.graphics.printf('Press Enter to Play Again!', 0, 190, VIRTUAL_WIDTH, 'center')
end