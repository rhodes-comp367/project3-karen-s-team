module App where

open import Agda.Builtin.Char
  using (Char)
open import Agda.Builtin.IO
  using (IO)
open import Agda.Builtin.List
  using (List)
open import Agda.Builtin.Nat
  using (Nat; suc; zero)
open import Agda.Builtin.String
  using (String)
open import Agda.Builtin.Unit
  using (⊤)
open import Fin
  using (Fin; suc; zero)
open import Product
  using (_×_; _,_)

postulate
  Gen
    : Set
  print : String
    → IO ⊤

data Event : Set where
  --up
  --  : Event
  --down
  --  : Event
  left
    : Event
  right
    : Event
  tick
    : Event
  space 
    : Event

record App : Set₁ where
  constructor
    app
  field
    State
      : Set
    initial : Gen
      → State
    draw : State
      → List (List Char)
    handle : Event → State
      → State

-- don't use these functions directly.
module Internal where
  postulate
    gen-nat : Nat → Gen
      → Nat × Gen
    undefined : ∀ {A : Set}
      → A
    run-brick : ∀ {S : Set} → Nat → (Gen → S) → (S → List (List Char)) → (Event → S → S)
      → IO ⊤

  from-nat : ∀ n → Nat
    → Fin n
  from-nat zero _
    = undefined
  from-nat (suc n) zero
    = zero
  from-nat (suc n) (suc k)
    = suc (from-nat n k)

-- randomly generate a Fin value; return the new generator.
gen-fin : ∀ {n} → Gen
  → Fin (suc n) × Gen
gen-fin {n} g
  with Internal.gen-nat (suc n) g
... | k , g'
  = Internal.from-nat (suc n) k , g'

-- first argument is time between ticks in microseconds.
run : Nat → App
  → IO ⊤
run n (app _ i d h)
  = Internal.run-brick n i d h

{-# FOREIGN GHC
  import Brick.AttrMap
    (AttrMap, forceAttrMap)
  import Brick.BChan
    (newBChan, writeBChan)
  import Brick.Main
    (App(..), continue, customMain, halt)
  import Brick.Types
    (BrickEvent(..), CursorLocation, EventM, Next, Widget)
  import Brick.Widgets.Border
    (border)
  import Brick.Widgets.Core
    (hBox, str, vBox)
  import Control.Concurrent
    (forkIO, threadDelay)
  import Control.Monad
    (forever)
  import qualified Data.Text.IO
    as T
  import Graphics.Vty
    (mkVty)
  import Graphics.Vty.Attributes
    (defAttr)
  import Graphics.Vty.Config
    (defaultConfig)
  import qualified Graphics.Vty.Input.Events
    as E
  import System.Random
    (StdGen, getStdGen)
  import Prelude
    hiding (Left, Right)

  genNat :: Integer -> StdGen
    -> (Integer, StdGen)
  genNat
    = undefined

  data Event
    = Left | Right | Tick | Space

  char :: Char
    -> Widget ()
  char
    = str . (: [])

  row :: [Char]
    -> Widget ()
  row
    = hBox . fmap char

  grid :: [[Char]]
    -> Widget ()
  grid
    = vBox . fmap row

  draw :: (s -> [[Char]]) -> s
    -> [Widget ()]
  draw d
    = (: []) . border . grid . d

  cursor :: s -> [CursorLocation ()]
    -> Maybe (CursorLocation ())
  cursor _ _
    = Nothing

  handle :: (Event -> s -> s) -> s -> BrickEvent () ()
    -> EventM () (Next s)
  handle _ s (VtyEvent (E.EvKey E.KEsc _))
    = halt s
  --handle h s (VtyEvent (E.EvKey E.KUp _))
  --  = continue (h Up s)
  --handle h s (VtyEvent (E.EvKey E.KDown _))
  --  = continue (h Down s)
  handle h s (VtyEvent (E.EvKey E.KLeft _))
    = continue (h Left s)
  handle h s (VtyEvent (E.EvKey E.KRight _))
    = continue (h Right s)
  handle h s (AppEvent _)
    = continue (h Tick s)
  handle h s (VtyEvent (E.EvKey (E.KChar ' ') _)) 
    = continue (h Space s)
  handle _ s _
    = continue s

  start
    :: s -> EventM () s
  start
    = pure

  attrs :: s
    -> AttrMap
  attrs _
    = forceAttrMap defAttr

  runBrick :: Integer -> (StdGen -> s) -> (s -> [[Char]]) -> (Event -> s -> s)
    -> IO ()
  runBrick n i d h = do
    vty
      <- mkVty defaultConfig
    chan
      <- newBChan 10
    _
      <- forkIO (forever (writeBChan chan () >> threadDelay (fromIntegral n)))
    app
      <- pure (App (draw d) cursor (handle h) start attrs)
    gen
      <- getStdGen
    _
      <- customMain vty (mkVty defaultConfig) (Just chan) app (i gen)
    pure ()
#-}

{-# COMPILE GHC Event
  = data Event (Left | Right | Tick | Space) #-}
{-# COMPILE GHC Gen
  = type StdGen #-}
{-# COMPILE GHC Internal.gen-nat
  = genNat #-}
{-# COMPILE GHC Internal.run-brick
  = \_ -> runBrick #-}
{-# COMPILE GHC Internal.undefined
  = \_ -> undefined #-}
{-# COMPILE GHC print
  = T.putStrLn #-}

