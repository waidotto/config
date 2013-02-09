import System.IO
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys, additionalKeysP)
import qualified XMonad.StackSet as W
main = do
	xmproc <- spawnPipe "xmobar"
	xmonad $ defaultConfig
		{ manageHook = manageDocks <+> manageHook defaultConfig
		, layoutHook = avoidStruts $ layoutHook defaultConfig
		, logHook = dynamicLogWithPP $ xmobarPP
			{ ppOutput = hPutStrLn xmproc
			, ppTitle = xmobarColor "green" "" . shorten 50
			}
		, terminal           = "gnome-terminal"
		, borderWidth        = 2
		, normalBorderColor  = "#333333"
		, focusedBorderColor = "#ffa500"
		} `additionalKeysP`
		myKeys

myKeys =
	[("M-S-r", do
		screenWorkspace 0 >>= flip whenJust (windows.W.view)
		(windows . W.greedyView) "1"
		screenWorkspace 1 >>= flip whenJust (windows.W.view)
		(windows . W.greedyView) "7")]

