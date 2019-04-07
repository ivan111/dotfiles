import XMonad
import XMonad.Config.Desktop

main = xmonad $ def
    { terminal = "urxvtc"
    , borderWidth = 0
    , manageHook = myManageHook <+> manageHook def }

myManageHook = composeAll
    [ className =? "Chromium" --> doShift "2"
    , className =? "Anki" --> doShift "3" ]
