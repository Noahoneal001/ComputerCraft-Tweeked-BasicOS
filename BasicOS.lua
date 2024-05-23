--First make variables
local screenX, screenY = term.getSize()
local isLogined = false
local logo = paintutils.loadImage("/BasicOS_Files/BasicLogo.nfp")
local ogScreen = term.current()
local usernameInput = "Username"
local passwordInput = "Password"
local username = "Nicehoan123"
local password = "FIREBALL!"
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

BasicOSHelper.drawImageAt(logo, math.floor(screenX/5), math.floor(screenY/4))

local usernameInputZone = window.create(term.current(), math.floor(screenX/5 + 8), math.floor(screenY/4 + 7), 12, 1)
local passwordInputZone = window.create(term.current(), math.floor(screenX/5 + 8), math.floor(screenY/4 + 9), 12, 1)

BasicOSHelper.makeLoginInput(usernameInputZone, colors.white, colors.black, "Username")
BasicOSHelper.makeLoginInput(passwordInputZone, colors.white, colors.black, "Password")

term.setBackgroundColor(colors.green)
term.setCursorPos(math.floor(screenX/5 + 11), math.floor(screenY/4 + 11))
write("LOGIN")

while not isLogined do
  local event, button, x, y = os.pullEvent("mouse_click")

  if event == "mouse_click" then
    if x >= math.floor(screenX/5 + 8) and x <= math.floor(screenX/5 + 8 + 12) and y == math.floor(screenY/4 + 7) then
      -- if BasicOS_Helper.isAreaClickedLine(x, y, math.floor(screenX/5 + 8))
      term.redirect(usernameInputZone)
      term.clear()
      term.setCursorPos(1,1)
      usernameInput = read()
      write(usernameInput)
      term.redirect(ogScreen)
    end
    if x >= math.floor(screenX/5 + 8) and x <= math.floor(screenX/5 + 8 + 12) and y == math.floor(screenY/4 + 9) then
      term.redirect(passwordInputZone)
      term.clear()
      term.setCursorPos(1,1)
      passwordInput = read("*")
      write(string.rep("*", string.len(passwordInput)))
      term.redirect(ogScreen)
    end
    if x >= math.floor(screenX/5 + 11) and x <= math.floor(screenX/5 + 16) and y == math.floor(screenY/4 + 11) then
      if usernameInput == username and passwordInput == password then
        os.pullEvent = yoink
        term.setBackgroundColor(colors.black)
        term.clear()
        term.setCursorPos(1,1)
        error()
      else
        term.setCursorPos(math.floor(screenX/5 + 9), math.floor(screenY/4 + 13))
        term.setBackgroundColor(colors.lightGray)
        term.setTextColor(colors.red)
        write("INCORRECT")
        term.setTextColor(colors.black)
      end
    end
  end
end