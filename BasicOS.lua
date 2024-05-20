--First make variables
local screenX, screenY = term.getSize()

--Second we prevent the user from force closeing the OS program before they past the login screen (We are saving the abilty to terminate to give back later)
--Josh:"The Lord yeet'th, and The Lord yoink'th away - Abraham Lincon, 2"
local yoink = os.pullEvent

os.pullEvent = os.pullEventRaw

--Third we clear the screen and set the cursor postion.
term.clear()

term.setCursorPos(1,1)

-- Now we are createing the start screen
paintutils.drawFilledBox(1, 1, 51, 19, colors.red)

