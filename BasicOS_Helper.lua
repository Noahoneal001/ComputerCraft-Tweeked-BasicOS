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

local function isAreaClickedLine(clickX, clickY, minX, maxX, y)
  return clickX >= minX and clickX <= maxX and clickY == y
end

return({ makeLoginInput = makeLoginInput, drawImageAt = drawImageAt, isAreaClickedLine = isAreaClickedLine })