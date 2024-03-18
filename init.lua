-- Links to configs

-- https://github.com/jwkvam/hammerspoon-config/blob/master/init.lua
-- https://gist.github.com/mtchllbrrn/efb5baabbafb8742fd52c826269dbdf0
------------------------------------------------------------
-- http://www.hammerspoon.org/docs/hs.ipc.html
-- https://groups.google.com/g/hammerspoon/c/QLlblL0zxU4
-- https://github.com/jwkvam/hammerspoon-config/blob/master/init.lua
-- Enable Hammerspoon CLI (hs command)
ipc = require("hs.ipc") -- needed for CLI to work.
local success = ipc.cliInstall() -- requires write access to /usr/local/bin

function changeVolume(diff) -- https://gist.github.com/spinscale/fd82f00da29447990f27f36b3f4b927d
    return function()
      local current = hs.audiodevice.defaultOutputDevice():volume()
      local new = math.min(100, math.max(0, math.floor(current + diff)))
      if new > 0 then
        hs.audiodevice.defaultOutputDevice():setMuted(false)
      end
      hs.alert.closeAll(0.0)
      hs.alert.show("Volume " .. new .. "%", {}, 0.5)
      hs.audiodevice.defaultOutputDevice():setVolume(new)
    end
  end

  --------------------------------------------------------
--- Hyperkey
-- Allows modifiers to be used with the Caps Lock (Hyper) key. https://evantravers.com/articles/2020/06/08/hammerspoon-a-better-better-hyper-key/
-- ISSUE: couldn't use F19 or others function keys because they beeped when shift+caps is pressed.
-- ISSUE: can't keybind modal keys to vscode?
hyper = hs.hotkey.modal.new({}, nil)

hyper.pressed = function()
    print("Entered hyper")
	keyModal:enter()
end

hyper.released = function()
    print("Exit hyper")
	keyModal:exit()
end

hs.hotkey.bind({}, 'pad*', hyper.pressed, hyper.released)
hs.hotkey.bind({"shift"}, 'pad*', hyper.pressed, hyper.released)
hs.hotkey.bind({"command"}, 'pad*', hyper.pressed, hyper.released)

--------------------------------------------------------------

local reloadHammerspoon = function()
    hs.application.launchOrFocus("Hammerspoon")
    hs.reload()
end

local log = hs.logger.new('','debug')
log.i(success)

function shell(command)
    hs.execute(command .. ' &', true)
 end

function moveWindowToDisplay(d)
    return function()
      local win = hs.window.focusedWindow() -- don't delete this line.
      win:moveToScreen(hs.screen.find((d - 1)..',0'), false, true, 0)
    end
  end

function focusWindowWithName(app, name)
  return function()
      hs.window.filter.new(function(win)
      return (
          win:application():name() == app and
          win:title():find(name, 1, true) -- title contains word
      )
      end):getWindows()[1]:focus()
  end
end


function focusDisplay(d)
    -- https://raw.githubusercontent.com/mskar/setup/main/init.lua
    return function()
    --Get windows within screen, ordered from front to back.
    --If no windows exist, bring focus to desktop. Otherwise, set focus on
    --front-most application window.
    local screen = hs.screen.find((d - 1)..',0')
    function isInScreen(screen, win)
        --Predicate that checks if a window belongs to a screen
        return win:screen() == screen
    end
    local windows = hs.fnutils.filter(
        hs.window.orderedWindows(),
        hs.fnutils.partial(isInScreen, screen))
    local windowToFocus = #windows > 0 and windows[1] or hs.window.desktop()
    windowToFocus:focus()
    end
end

function maximizeFocusedWindow()
    hs.window.focusedWindow():maximize(0)
  end

--------------------------------------------------------------------
-- Cycle Windows same app same monitor
-- https://github.com/Hammerspoon/hammerspoon/issues/856#issuecomment-209542078

local currentWindowSet = {}
local windowCycler = nil

local wf = hs.window.filter.new(function(win)
    local fw = hs.window.focusedWindow()
    return (
      win:isStandard() and
      win:application() == fw:application() and
      win:screen() == fw:screen()
    )
end)

local function makeTableCycler(t)
  local i = 1
  return function(d)
    local j = d and d < 0 and -2 or 0
    i = (i + j) % #t + 1
    local x = t[i]
    return x
  end
end

local function updateWindowCycler()
    if not hs.fnutils.contains(currentWindowSet, hs.window.focusedWindow()) then
        currentWindowSet = wf:getWindows()
        windowCycler = makeTableCycler(currentWindowSet)
    end
end

local function nextWindowSameMonitorSameApp()
    updateWindowCycler()
    windowCycler():focus()
end

local function prevWindowSameMonitorSameApp()
    updateWindowCycler()
    windowCycler():focus()
end



-------------------------------------------------------------
-- https://github.com/Hammerspoon/hammerspoon/issues/595#issuecomment-146869709
local wf_space=hs.window.filter.new(nil,'wf-SPACE'):setCurrentSpace(true)
function focusMonitorRight() 
    wf_space:focusWindowEast(nil,true,true)
end
function focusMonitorLeft()
    wf_space:focusWindowWest(nil,true,true)
end

------------------------------------------------------------------
-- TODO attempting to do same app same monitor
-- local sameMonitorDiffApp=hs.window.filter.new(nil,'wf-SPACE'):setCurrentSpace(true):setDefaultFilter{}

local sameMonitorSameAppWindows = hs.window.filter.new(function(win)
    local fw = hs.window.focusedWindow()
    return (
        win:isStandard() and
        win:application() == fw:application() and
        win:screen() == fw:screen()
    )
end)
-- hs.window.filter.new():setAppFilter('Code')
-- hs.window.filter.new():setAppFilter('Code'):setCurrentSpace(true)
-- :sortByFocusedLast
-- local sameMonitorSameAppWindows = hs.window.filter.new():setAppFilter('Code'):setCurrentSpace(true)
-- hs.hotkey.bind({ "ctrl" }, "`", function()
--     local windows = sameMonitorSameAppWindows:getWindows()
--     -- for i, v in ipairs(windows) do
--     --     if i==1 then v:sendToBack() end
--     -- end
--     sameMonitorSameAppWindows:getWindows()[1]:sendToBack()
--     -- windows[1]
--     -- sameMonitorSameAppWindows:focusWindowEast()
--     print(type(windows))
--     print(hs.inspect(windows))
-- end)
-- hs.hotkey.bind({ "ctrl", "command" }, "`", function()
--     -- sameMonitorSameAppWindows:focusWindowWest()
--     local windows = sameMonitorSameAppWindows:getWindows()
--     windows[#windows + 1].focus()
-- end)
-- :setCurrentSpace(true)
-- function values(t)
    --     local i = 0
    --     return function() i = i + 1; return t[i] end
    --   end
    -- for v in values(windows) do
    --     print(v)
    -- end
----------------------------
-- hs.hotkey.bindSpec({ { "cmd", "ctrl" }, "s" }, moveWindowToDisplay(0))
-- hs.hotkey.bindSpec({ { "cmd", "ctrl" }, "d" }, moveWindowToDisplay(1))
-- hs.hotkey.bindSpec({ { "cmd", "ctrl" }, "f" }, moveWindowToDisplay(2))
-- hs.hotkey.bindSpec({ { "cmd", "ctrl" }, "left" }, moveWindowToDisplay(0))
-- hs.hotkey.bindSpec({ { "cmd", "ctrl" }, "down" }, moveWindowToDisplay(1))
-- hs.hotkey.bindSpec({ { "cmd", "ctrl" }, "right" }, moveWindowToDisplay(2))

hs.hotkey.bindSpec({ { "cmd", "alt", "ctrl" }, "left" }, function() hs.window.focusedWindow():moveOneScreenWest(0) end)
hs.hotkey.bindSpec({ { "cmd", "alt", "ctrl" }, "right" }, function() hs.window.focusedWindow():moveOneScreenEast(0) end)
hs.hotkey.bindSpec({ { "cmd", "alt", "ctrl" }, "z" }, function() hs.window.focusedWindow():moveOneScreenWest(0) end)
hs.hotkey.bindSpec({ { "cmd", "alt", "ctrl" }, "x" }, function() hs.window.focusedWindow():moveOneScreenEast(0) end)

-- hs.hotkey.bindSpec({ { "shift", "command" }, "left" }, function() hs.window:focusWindowWest() end)
-- hs.hotkey.bindSpec({ { "shift", "command" }, "right" }, function() hs.window:focusWindowRight() end)
-- https://github.com/Hammerspoon/hammerspoon/issues/595#issuecomment-146869709

-- hs.hotkey.bindSpec({ { "ctrl" }, "z" }, function() focusMonitorRight() end)
-- hs.hotkey.bindSpec({ { "ctrl" }, "x" }, function() focusMonitorLeft() end)

hs.hotkey.bindSpec({ { "shift", "command" }, "a" }, focusDisplay(0))
hs.hotkey.bindSpec({ { "shift", "command" }, "s" }, focusDisplay(1))
hs.hotkey.bindSpec({ { "shift", "command" }, "d" }, focusDisplay(2))
hs.hotkey.bindSpec({ { "shift", "command" }, "left" }, focusDisplay(0))
hs.hotkey.bindSpec({ { "shift", "command" }, "down" }, focusDisplay(1))
hs.hotkey.bindSpec({ { "shift", "command" }, "right" }, focusDisplay(2))


hs.hotkey.bind({ "ctrl", "alt", "command" }, "s", focusWindowWithName("Code", "snippets"))
hs.hotkey.bind({ "ctrl", "alt", "command" }, "n", focusWindowWithName("Code", "notes"))
hs.hotkey.bind({ "ctrl", "alt", "command" }, "c", focusWindowWithName("Code", "dotfiles"))
hs.hotkey.bind({ "ctrl", "alt", "command" }, "r", focusWindowWithName("Code", "references"))
hs.hotkey.bind({ "ctrl", "alt", "command" }, "m", focusWindowWithName("Code", "pymusic"))

hs.hotkey.bind({"shift", "command"}, "return", maximizeFocusedWindow)
-- hs.hotkey.bind({ "ctrl" }, "x", nextWindowSameMonitorSameApp)
-- hs.hotkey.bind({ "ctrl" }, "z", prevWindowSameMonitorSameApp)
hs.hotkey.bind({ "ctrl" }, "`", nextWindowSameMonitorSameApp)
hs.hotkey.bind({ "ctr`l", "shift" }, "`", prevWindowSameMonitorSameApp)

hs.hotkey.bind({"alt"}, "r", reloadHammerspoon)

hyper:bind({}, 'r', nil, function()
    print("pressed hyper+r")
    hs.alert.show('pressed hyper+r')
end)
hyper:bind({"shift"}, 'r', nil, function()
    print("pressed hyper+shift+r")
    hs.alert.show('pressed hyper+shift+r')
end)

-------------------------------
-- hs.tabs.enableForApp("com.microsoft.VSCode")
-- hs.chooser.new(function(choice)

--     local toggl = require('Spoons/Headspace/toggl')
--     toggl.startTimer(hs.settings.get("secrets").toggl.projects.binge, choice.text)

--     -- Open URL of choice
--     hs.urlevent.openURL(choice.url)
--   end)
--   :choices({
--     {
--       text = 'Netflix',
--       url = 'http://netflix.com/'
--     },
--     {
--       text = 'Youtube',
--       url = 'https://www.youtube.com/feed/subscriptions/'
--     },
--   })
--   :placeholderText("What do you want to binge?")
--     :show()

----------------------------------------
-- local wf=hs.window.filter
-- --wf.default:setAppFilter('Visual Studio Code',{allowTitles=1}) -- ignore no-title windows (e.g. transient autocomplete suggestions) in My IDE

--  -- any Safari windows with "reddit" anywhere in the title
-- -- set up your windowfilter
-- switcher = hs.window.switcher.new(wf.new(false):setAppFilter('Code')) -- default windowfilter: only visible windows, all Spaces
-- switcher.ui.highlightColor = {0.4,0.4,0.5,0.8}
-- switcher.ui.thumbnailSize = 112
-- switcher.ui.selectedThumbnailSize = 284
-- switcher.ui.backgroundColor = {0.3, 0.3, 0.3, 0.5}
-- -- switcher.ui.fontName = 'System'
-- switcher.ui.textSize = 14
-- switcher.ui.showSelectedTitle = false

-- -- bind to hotkeys; WARNING: at least one modifier key is required!
-- hs.hotkey.bind("alt","tab",function()switcher:next()end)
-- hs.hotkey.bind("alt-shift","tab",function()switcher:previous()end)

-- log.i(hs.inspect.inspect(hs.screen.screenPositions()))
-- -- local yourHotkey = hs.hotkey.new({ "cmd" }, "0", function()
-- --     hs.eventtap.keyStrokes("000000000000000000")
-- -- end)


-- local wf = hs.window.filter.new(function(win)
--     return (
--         win:application():name() == "Code" and
--         win:title():find("notes", 1, true) -- title contains word
--     )
--   end)

--   function values(t)
--     local i = 0
--     return function() i = i + 1; return t[i] end
--   end
-- for v in values(wf:getWindows()) do
--     log.i(v)
-- end

  
--   hyperKey
--     :bind('h'):toFunction("Reload Hammerspoon", reloadHammerspoon)
--     :bind('l'):toFunction("Lock screen", hs.caffeinate.startScreensaver)


-- local hyper = hs.hotkey.modal.new({}, nil)

-- hyper.pressed = function()
--   hyper:enter()
-- end

-- hyper.released = function()
--   hyper:exit()
-- end

-- -- Set the key you want to be HYPER to F19 in karabiner or keyboard
-- -- Bind the Hyper key to the hammerspoon modal
-- hs.hotkey.bind({}, 'F18', hyper.pressed, hyper.released)

-- hyper:bind({'shift'}, 'r', nil, function() hs.alert.show('got ipc!') end)


-- hyper = hs.hotkey.modal.new({}, 'F17')

-- -- Enter Hyper Mode when F18 (Hyper/Capslock) is pressed
-- function enterHyperMode()
--   hyper.triggered = false
--   hyper:enter()
-- end

-- -- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
-- -- send ESCAPE if no other keys are pressed.
-- function exitHyperMode()
--   hyper:exit()
--   if not hyper.triggered then
--     hs.eventtap.keyStroke({}, 'ESCAPE')
--   end
-- end

-- -- Bind the Hyper key
-- f18 = hs.hotkey.bind({}, 'F18', enterHyperMode, exitHyperMode)


-- hyper:bind({}, 'r', function()
--     hs.eventtap.keyStroke({'cmd','alt','shift','ctrl'}, 'u')
--     hyper.triggered = true
--   end)


-----------------------------------------
-- keyModal:bind({"shift"}, 'r', nil, function()
--     -- local focused = hs.window.focusedWindow()
--     print("press hyper+shift+r")
--     hs.alert.show('press hyper+shift+r')
--     -- hs.layout.apply({ {nil, focused, focused:screen(), hs.layout.maximized, 0, 0} })
-- end)


-- local hyper = {'cmd', 'alt', 'ctrl', 'shift'}

-- -- Load and create a new switcher
-- local HyperKey = hs.loadSpoon("HyperKey")
-- hyperKey = HyperKey:new(hyper)

--  -> ipcObject	
-- a remote port can send messages at any time to a local port; a local port can only respond to messages from a remote port

-- function onPortReceive()
-- local testReceiver = hs.ipc.localPort("testname", function()
--     hs.ipc:sendMessage("testmessage", 1)
-- end)
-- How to get terminal input to Hammerspoon
-- https://groups.google.com/g/hammerspoon/c/HiFLShOYpVI
-- Call hs.ipc.cliInstall() then you can simply call `hs` from the terminal to enter the REPL.
-- https://www.hammerspoon.org/docs/hs.ipc.html#cliInstall


-- function moveWindowOneSpace(dir,switch)
--     -- DEPRECATED: use hs.window.focusedWindow():moveOneScreenEast(0)
--     -- https://github.com/Hammerspoon/hammerspoon/issues/3111#issuecomment-1067366351
--     local win = getGoodFocusedWindow(true)
--     if not win then return end
--     local screen=win:screen()
--     local uuid=screen:getUUID()
--     local userSpaces=nil
--     for k,v in pairs(spaces.allSpaces()) do
--        userSpaces=v
--        if k==uuid then break end
--     end
--     if not userSpaces then return end
--     local thisSpace=spaces.windowSpaces(win) -- first space win appears on
--     if not thisSpace then return else thisSpace=thisSpace[1] end
--     local last=nil
--     local skipSpaces=0
--     for _, spc in ipairs(userSpaces) do
--        if spaces.spaceType(spc)~="user" then -- skippable space
--       skipSpaces=skipSpaces+1
--        else
--       if last and
--          ((dir=="left" and spc==thisSpace) or
--           (dir=="right" and last==thisSpace)) then
--             local newSpace=(dir=="left" and last or spc)
--             if switch then
--            -- spaces.gotoSpace(newSpace)  -- also possible, invokes MC
--            switchSpace(skipSpaces+1,dir)
--             end
--             spaces.moveWindowToSpace(win,newSpace)
--             return
--       end
--       last=spc	 -- Haven't found it yet...
--       skipSpaces=0
--        end
--     end
--     flashScreen(screen)   -- Shouldn't get here, so no space found
--  end
