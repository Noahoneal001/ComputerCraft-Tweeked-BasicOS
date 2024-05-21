--First make variables
local screenX, screenY = term.getSize()
local isLogined = false
local logo = paintutils.loadImage("BasicLogo.nfp")

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

term.setCursorPos(screenX/5,screenY/4)
paintutils.drawImage(logo,term.getCursorPos())

paintutils.drawLine(screenX/5 + 8, screenY/4 + 7, screenX/5 + 18, screenY/4 + 7 , colors.white)
term.setCursorPos(screenX/5 + 8, screenY/4 + 7)
term.write("Username")

paintutils.drawLine(screenX/5 + 8, screenY/4 + 9, screenX/5 + 18, screenY/4 + 9 , colors.white)
term.setCursorPos(screenX/5 + 8, screenY/4 + 9)
term.write("Password")

while not isLogined do 
  read()
  error()
end