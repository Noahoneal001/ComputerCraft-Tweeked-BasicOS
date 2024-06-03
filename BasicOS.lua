--First make variables
local screenX, screenY = term.getSize()
local middleScreenX = math.floor(screenX/5)
local middleScreenY = math.floor(screenY/4)
local isLogined = false
local logo = paintutils.loadImage("/BasicOS_Files/systemImgs/BasicLogo.nfp")
local ogScreen = term.current()
local usernameInput = "Username"
local passwordInput = "Password"
local username = "Username"
local password = "Password"
local BasicOSHelper = require("BasicOS_Helper")

--Second we prevent the user from force closeing the OS program before they past the login screen (We are saving the abilty to terminate to give back later)
--Josh:"The Lord yeet'th, and The Lord yoink'th away - Abraham Lincon, 2"
local yoink = os.pullEvent


os.pullEvent = os.pullEventRaw

--Third we clear the screen and set the cursor postion.
term.clear()
term.setCursorPos(1,1)

-- Now we are createing the start screen
BasicOSHelper.newBackground(colors.lightGray)

term.setTextColor(colors.black)

BasicOSHelper.drawImageAt(logo, middleScreenX, middleScreenY)

local usernameInputZone = window.create(term.current(), middleScreenX + 8, middleScreenY + 7, 12, 1)
local passwordInputZone = window.create(term.current(), middleScreenX + 8, middleScreenY + 9, 12, 1)

BasicOSHelper.makeLoginInput(usernameInputZone, colors.white, colors.black, "Username")
BasicOSHelper.makeLoginInput(passwordInputZone, colors.white, colors.black, "Password")

term.setBackgroundColor(colors.green)
term.setCursorPos(middleScreenX + 11, middleScreenY + 11)
write("LOGIN")

while not isLogined do
  local event, button, x, y = os.pullEvent("mouse_click")

  if event == "mouse_click" then
    if BasicOSHelper.isAreaClickedLine(x, y, middleScreenX + 8, 12, middleScreenY + 7) then
      usernameInput = BasicOSHelper.inputBoxBrain(usernameInputZone, nil, ogScreen)
    end

    if BasicOSHelper.isAreaClickedLine(x, y, middleScreenX + 8, 12, middleScreenY + 9) then
      passwordInput = BasicOSHelper.inputBoxBrain(passwordInputZone, "*", ogScreen, true)
    end

    if BasicOSHelper.isAreaClickedLine(x, y, middleScreenX + 11, 5, middleScreenY + 11) then
      if usernameInput == username and passwordInput == password then
        isLogined = true
      else
        term.setCursorPos(middleScreenX + 9, middleScreenY + 13)
        term.setBackgroundColor(colors.lightGray)
        term.setTextColor(colors.red)
        write("INCORRECT")
        term.setTextColor(colors.black)
      end
    end
  end
end

BasicOSHelper.newBackground(colors.black)
os.pullEvent = yoink

paintutils.drawLine(1, screenY, screenX, screenY, colors.yellow)
term.setCursorPos(1, screenY)
term.setBackgroundColor(colors.green)
term.setTextColor(colors.white)
write("MENU")


local appIconImg = paintutils.loadImage("/BasicOS_Files/systemImgs/shellIcon.nfp")
local arrowLeft = paintutils.loadImage("/BasicOS_Files/systemImgs/leftArrow.nfp")
local arrowRight = paintutils.loadImage("/BasicOS_Files/systemImgs/rightArrow.nfp")
local appIcon = window.create(ogScreen, middleScreenX + 10, middleScreenY + 1, 13, 9)

term.redirect(appIcon)
BasicOSHelper.drawImageAt(appIconImg, 1, 1)
term.redirect(ogScreen)

BasicOSHelper.drawImageAt(arrowLeft, middleScreenX + 3, middleScreenY + 2)
BasicOSHelper.drawImageAt(arrowRight, middleScreenX + 25, middleScreenY + 2)

term.redirect(ogScreen)
paintutils.drawLine(middleScreenX + 10, middleScreenY + 11, middleScreenX + 21, middleScreenY + 11, colors.white)
term.setCursorPos(middleScreenX + 10, middleScreenY + 11)
term.setTextColor(colors.black)
term.write("Shell")

while true do
  local event, mouseButton, x, y = os.pullEvent("mouse_click")
  if ((x >= middleScreenX + 10) and (x <= middleScreenX + 23)) then
    shell.run("fg", "shell")
  end
end

local stop = os.pullEvent("modem_message")