--First make variables
local screenX, screenY = term.getSize()
local isLogined = false
local logo = paintutils.loadImage("/BasicOS_Files/BasicLogo.nfp")
local ogScreen = term.current()
local BasicOSHelper = require("BasicOS_Helper")

--Second we prevent the user from force closeing the OS program before they past the login screen (We are saving the abilty to terminate to give back later)
--Josh:"The Lord yeet'th, and The Lord yoink'th away - Abraham Lincon, 2"
local yoink = os.pullEvent

os.pullEvent = os.pullEventRaw

--Third we clear the screen and set the cursor postion.
term.clear()
term.setCursorPos(1,1)

-- Now we are createing the start screen
term.setBackgroundColor(colors.lightGray)
term.clear()

term.setTextColor(colors.black)

BasicOSHelper.drawImageAt(logo, screenX/5, screenY/4)

local usernameInput = window.create(term.current(), screenX/5 + 8, screenY/4 + 7, 12, 1)
local passwordInput = window.create(term.current(), screenX/5 + 8, screenY/4 + 9, 12, 1)

BasicOSHelper.makeLoginInput(usernameInput, colors.white, colors.black, "Username")
BasicOSHelper.makeLoginInput(passwordInput, colors.white, colors.black, "Password")

while not isLogined do
  local event, button, x, y = os.pullEvent("mouse_click")

  if event == "mouse_click" then
    if x >= screenX/5 + 8 and x <= screenX/5 + 8 + 12 and y == screenY/4 + 7 then
      term.redirect(usernameInput)
end