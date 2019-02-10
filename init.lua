hyper = {"ctrl", "alt", "cmd"}
hs.window.animationDuration = 0
hs.hotkey.bind(hyper, 'r', function() 
  hs.reload()
end)
hs.loadSpoon("BingDaily")
hs.alert.show("Config loaded")


hs.hotkey.bind(hyper, '[', function() 
  hs.window.frontmostWindow():moveOneScreenWest()

end)

hs.hotkey.bind(hyper, ']', function() 
  hs.window.frontmostWindow():moveOneScreenEast()
end)


hs.hotkey.bind(hyper, ',', function() 
  hs.window.frontmostWindow():minimize()
end)

hs.hotkey.bind(hyper, '.', function()
  for i,w in ipairs(hs.window.visibleWindows()) do
    w:minimize()
  end
end)

hs.hotkey.bind(hyper, ';', function()
  local orderedWindows = hs.window.orderedWindows()
  local w1 = orderedWindows[1]  
  local w2 = orderedWindows[2]
  local f1 = w1:frame()
  local f2 = w2:frame()

  w1:setFrame(f2)
  w2:setFrame(f1)

end)

-- set window position and size
function layWindow(x,y,w,h)
  return function()
    local window = hs.window.frontmostWindow()
    local frame = window:screen():frame()
    local f = window:frame()
    
    f.x = frame._x+math.floor(frame._w*x)
    f.y = frame._y+math.floor(frame._h*y)
    f.w = math.floor(frame._w*w)
    f.h = math.floor(frame._h*h)  
    window:setFrame(f)
  end
end

hs.hotkey.bind(hyper, 'o', layWindow(0,0,1,1))
hs.hotkey.bind(hyper, 'g', layWindow(1/6,1/6,2/3,2/3))
hs.hotkey.bind(hyper, 'j', layWindow(0,0,1,1/2))
hs.hotkey.bind(hyper, 'k', layWindow(0,1/2,1,1/2))
hs.hotkey.bind(hyper, 'h', layWindow(0,0,1/2,1))
hs.hotkey.bind(hyper, 'l', layWindow(1/2,0,1/2,1))
hs.hotkey.bind(hyper, 'y', layWindow(0,0,1/2,1/2))
hs.hotkey.bind(hyper, 'p', layWindow(1/2,0,1/2,1/2))
hs.hotkey.bind(hyper, 'n', layWindow(0,1/2,1/2,1/2))
hs.hotkey.bind(hyper, 'm', layWindow(1/2,1/2,1/2,1/2))

-- lock screen
hs.hotkey.bind({"ctrl", "cmd"}, 'l', function()
    hs.caffeinate.lockScreen()
end)


hs.hotkey.bind({"alt"}, "tab", function()
  -- hs.hints.style="vimperator"
  hs.hints.windowHints()
end)

hs.hotkey.bind({"ctrl"}, "tab", function()
  hs.hints.style=""
  hs.hints.windowHints(hs.window.focusedWindow():application():allWindows())
end)
--======================= for test
