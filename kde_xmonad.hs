import XMonad
import Data.Monoid
import XMonad.Config.Kde
import XMonad.Util.EZConfig (additionalKeysP,additionalKeys)

-- Actions
import XMonad.Actions.CycleWS


--- for ||| operator and "core layouts/building blocks", such as
    -- Full
    -- Tall
    -- Mirror
import XMonad.Layout -- for ||| operator and 
import XMonad.Layout.Grid
import XMonad.Layout.Magnifier
import XMonad.Layout.Tabbed -- for "tabbed" and "shrinkText"
import XMonad.Hooks.ManageDocks -- for "avoidStruts"
import XMonad.Layout.Accordion
import XMonad.Layout.SimplestFloat
import XMonad.Layout.ResizableTile
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Layout.NoBorders -- for "smartBorders"

    -- Layouts modifiers
import XMonad.Layout.LayoutModifier
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.ShowWName
import XMonad.Layout.Simplest
import XMonad.Layout.Spacing
import XMonad.Layout.TwoPane
import XMonad.Layout.SubLayouts
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))
import XMonad.Layout.WindowNavigation
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))
import qualified XMonad.Layout.MultiToggle as MT (Toggle(..))

import Debug.Trace
------------------------------------------------------------------------
-- Layouts:
 
-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--

-- setting colors for tabs layout and tabs sublayout.
mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

myTheme = def { inactiveBorderColor = "#FF0000"
               , activeTextColor     = "#00FF00" }

tall     = renamed [Replace "tall"]
           $ smartBorders
           -- $ windowNavigation
           -- $ addTabs shrinkText myTheme
           -- $ subLayout [] (smartBorders Simplest)
           $ subTabbed
           $ mySpacing 0
           $ ResizableTall 1 (3/100) (1/2) []
-- threeRow = renamed [Replace "threeRow"]
--            $ smartBorders
--            $ windowNavigation
--            $ addTabs shrinkText myTheme
--            $ subLayout [] (smartBorders Simplest)
--            $ Mirror
--            $ ThreeCol 1 (3/100) (1/2)
tabs     = renamed [Replace "tabs"]
           -- I cannot add spacing to this layout because it will
           -- add spacing between window and tabs which looks bad.
           $ tabbed shrinkText myTheme
myLayout = addTabs shrinkText def
         $ subLayout [0,1,2] (Simplest ||| Tall 1 0.2 0.5 ||| Circle)
         $ Tall 1 0.2 0.5 ||| Full
-- ***********  Rest of Config  ***********
myModMask :: KeyMask
myModMask = mod4Mask

myWorkspaces    = ["emacs","lunatique","www", "terminals"] ++ map show [5..10] ++ ["wifi", "music", "SP"]
myTerminal      = "termite"
myLayout = avoidStruts $
           tall -- vertical master stack with sub tab two pane
           ||| Mirror tall -- horizontal master stack with sub tab
           -- ||| Full
           -- ||| Grid
           ||| noBorders tabs

-- TODO: 1 key to switch between vertical and horizontal
-- TODO: 1 key to switch between full and original

 
------------------------------------------------------------------------
main :: IO()
main = xmonad $ kdeConfig 
    {
        modMask            = myModMask,
        terminal           = myTerminal,
        layoutHook         = myLayout,
        workspaces         = myWorkspaces
    }  
    `additionalKeys`
    [
        ((myModMask,               xK_Down),  nextWS)
        , ((myModMask .|. controlMask, xK_Up),    prevWS)
        , ((myModMask .|. shiftMask, xK_Down),  shiftToNext)
        , ((myModMask .|. shiftMask, xK_Up),    shiftToPrev)
        , ((myModMask,               xK_Right), nextScreen)
        , ((myModMask,               xK_Left),  prevScreen)
        , ((myModMask .|. shiftMask, xK_Right), shiftNextScreen)
        , ((myModMask .|. shiftMask, xK_Left),  shiftPrevScreen)
        , ((myModMask,               xK_z),     toggleWS)
    ]


