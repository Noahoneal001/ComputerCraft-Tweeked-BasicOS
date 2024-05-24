local function makeLoginInput(window, boxColor, TextColor, text)
  window.setBackgroundColor(boxColor)
  window.clear()
  window.setTextColor(TextColor)
  window.setCursorPos(1,1)
  window.write(text)
end

local function drawImageAt(image, x, y)
  term.setCursorPos(x,y)
  paintutils.drawImage(image,term.getCursorPos())
end

local function isAreaClickedLine(clickX, clickY, minX, width, y)
  return clickX >= minX and clickX <= minX + width and clickY == y
end

local function inputBoxBrain(box, readReplace, mainScreen, isPassword)
  term.redirect(box)
  term.clear()
  term.setCursorPos(1,1)
  local saved = read(readReplace)
  if isPassword then
    write(string.rep("*", string.len(saved)))
  else
    write(saved)
  end
  term.redirect(mainScreen)
  return saved
end

local function newBackground(color)
  term.setBackgroundColor(color)
  term.clear()
end

return({ makeLoginInput = makeLoginInput, drawImageAt = drawImageAt, isAreaClickedLine = isAreaClickedLine, inputBoxBrain = inputBoxBrain, newBackground = newBackground })