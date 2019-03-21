import XMonad
import XMonad.Config.Desktop

main = xmonad $ def
    { terminal = "urxvt"
    , borderWidth = 0 }
