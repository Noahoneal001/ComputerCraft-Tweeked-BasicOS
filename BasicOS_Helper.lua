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
  
  return({ makeLoginInput = makeLoginInput, drawImageAt = drawImageAt })
  