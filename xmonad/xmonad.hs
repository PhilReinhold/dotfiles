--
-- xmonad example config file.
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.SubLayouts
import XMonad.Layout.WindowNavigation
import XMonad.Layout.BoringWindows
import XMonad.Layout.NoBorders
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Prompt
import XMonad.Prompt.AppendFile
import XMonad.Prompt.AppLauncher
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig

-- import Data.Monoid
-- import System.Exit
import System.IO

import qualified XMonad.StackSet as W
-- import qualified Data.Map        as M

myLayout = avoidStruts $ windowNavigation $ subTabbed $ boringWindows $
  smartBorders (tiled ||| Mirror tiled ||| threecol) ||| noBorders simpleTabbed 
  where
     tiled   = Tall nmaster delta ratio
     threecol = ThreeColMid nmaster delta ratio
     nmaster = 1
     ratio   = 1/2
     delta   = 3/100

myXPConfig = defaultXPConfig
defaults = defaultConfig

myConfig = defaults {
    terminal     = "urxvt",
    borderWidth  = 3,
    normalBorderColor = "#586e75",
    focusedBorderColor = "#859900",
    manageHook = manageDocks <+> manageHook defaults,
    layoutHook = myLayout
    } `additionalKeysP` [
     ("M-b", sendMessage ToggleStruts),
     ("M-n", appendFilePrompt myXPConfig "/home/phil/Dropbox/notes.txt"),
     ("M-g", launchApp myXPConfig "surfraw"),
--          SubTabbed Commands
     ("M-C-h", sendMessage $ pullGroup L),
     ("M-C-j", sendMessage $ pullGroup R),
     ("M-C-k", sendMessage $ pullGroup U),
     ("M-C-l", sendMessage $ pullGroup D),
     ("M-C-m", withFocused (sendMessage . MergeAll)),
     ("M-C-u", withFocused (sendMessage . UnMerge)),
     ("M-C-.", onGroup W.focusUp'),
     ("M-C-,", onGroup W.focusDown'),
     ("M-j", focusDown),
     ("M-k", focusUp),
     ("M-<F7>", spawn "setxkbmap us"),
     ("M-<F8>", spawn "setxkbmap -variant colemak")
    ]

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar"
    xmonad $ myConfig {
       logHook = dynamicLogWithPP xmobarPP {
                    ppOutput = hPutStrLn xmproc,
                    ppTitle = xmobarColor "green" "" . shorten 50
                    }
       }

