{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.App where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Char
import qualified MAlonzo.Code.Agda.Builtin.IO
import qualified MAlonzo.Code.Agda.Builtin.List
import qualified MAlonzo.Code.Agda.Builtin.Nat
import qualified MAlonzo.Code.Agda.Builtin.String
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Fin
import qualified MAlonzo.Code.Product

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
name2 = "App.Gen"
type T2 = StdGen
d2 = error "MAlonzo Runtime Error: postulate evaluated: App.Gen"
name4 = "App.print"
d4 ::
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  MAlonzo.Code.Agda.Builtin.IO.T8
    () MAlonzo.Code.Agda.Builtin.Unit.T6
d4 = T.putStrLn
name6 = "App.Event"
d6 = ()
type T6 = Event
pattern C8 = Left
pattern C10 = Right
pattern C12 = Tick
pattern C14 = Space
check8 :: T6
check8 = Left
check10 :: T6
check10 = Right
check12 :: T6
check12 = Tick
check14 :: T6
check14 = Space
cover6 :: Event -> ()
cover6 x
  = case x of
      Left -> ()
      Right -> ()
      Tick -> ()
      Space -> ()
name16 = "App.App"
d16 = ()
data T16
  = C34 (T2 -> AgdaAny)
        (AgdaAny -> [[MAlonzo.Code.Agda.Builtin.Char.T6]])
        (T6 -> AgdaAny -> AgdaAny)
name26 = "App.App.State"
d26 :: T16 -> ()
d26 = erased
name28 = "App.App.initial"
d28 :: T16 -> T2 -> AgdaAny
d28 v0
  = case coe v0 of
      C34 v2 v3 v4 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
name30 = "App.App.draw"
d30 :: T16 -> AgdaAny -> [[MAlonzo.Code.Agda.Builtin.Char.T6]]
d30 v0
  = case coe v0 of
      C34 v2 v3 v4 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
name32 = "App.App.handle"
d32 :: T16 -> T6 -> AgdaAny -> AgdaAny
d32 v0
  = case coe v0 of
      C34 v2 v3 v4 -> coe v4
      _ -> MAlonzo.RTE.mazUnreachableError
name38 = "App.Internal.gen-nat"
d38 :: Integer -> T2 -> MAlonzo.Code.Product.T6 Integer T2
d38 = genNat
name42 = "App.Internal.undefined"
d42 :: forall xA. () -> xA
d42 = \_ -> undefined
name46 = "App.Internal.run-brick"
d46 ::
  forall xS.
    () ->
    Integer ->
    (T2 -> xS) ->
    (xS ->
     MAlonzo.Code.Agda.Builtin.List.T10
       ()
       (MAlonzo.Code.Agda.Builtin.List.T10
          () MAlonzo.Code.Agda.Builtin.Char.T6)) ->
    (T6 -> xS -> xS) ->
    MAlonzo.Code.Agda.Builtin.IO.T8
      () MAlonzo.Code.Agda.Builtin.Unit.T6
d46 = \_ -> runBrick
name50 = "App.Internal.from-nat"
d50 :: Integer -> Integer -> MAlonzo.Code.Fin.T2
d50 v0 v1
  = case coe v0 of
      0 -> coe d42 erased
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           case coe v1 of
             0 -> coe MAlonzo.Code.Fin.C6
             _ -> let v3 = subInt (coe v1) (coe (1 :: Integer)) in
                  coe MAlonzo.Code.Fin.C10 (d50 (coe v2) (coe v3))
name60 = "App.gen-fin"
d60 ::
  Integer -> T2 -> MAlonzo.Code.Product.T6 MAlonzo.Code.Fin.T2 T2
d60 v0 v1
  = let v2 = coe d38 (addInt (coe (1 :: Integer)) (coe v0)) v1 in
    case coe v2 of
      MAlonzo.Code.Product.C12 v3 v4
        -> coe
             MAlonzo.Code.Product.C12
             (coe d50 (coe addInt (coe (1 :: Integer)) (coe v0)) (coe v3))
             (coe v4)
      _ -> MAlonzo.RTE.mazUnreachableError
name78 = "App.run"
d78 ::
  Integer ->
  T16 ->
  MAlonzo.Code.Agda.Builtin.IO.T8
    AgdaAny MAlonzo.Code.Agda.Builtin.Unit.T6
d78 v0 v1
  = case coe v1 of
      C34 v3 v4 v5 -> coe d46 erased v0 v3 v4 v5
      _ -> MAlonzo.RTE.mazUnreachableError
