{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Main where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Bool
import qualified MAlonzo.Code.Agda.Builtin.Char
import qualified MAlonzo.Code.Agda.Builtin.IO
import qualified MAlonzo.Code.Agda.Builtin.List
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.App
import qualified MAlonzo.Code.Fin

name8 = "Main.⊥"
d8 = ()
data T8
name10 = "Main.¬"
d10 :: () -> ()
d10 = erased
name14 = "Main.~"
d14 :: () -> ()
d14 = erased
name22 = "Main._×_"
d22 a0 a1 = ()
data T22 = C28 AgdaAny AgdaAny
name34 = "Main._⊔_"
d34 a0 a1 = ()
data T34 = C40 AgdaAny | C42 AgdaAny
name44 = "Main.Point"
d44 = ()
data T44 = C54 MAlonzo.Code.Fin.T2 MAlonzo.Code.Fin.T2
name50 = "Main.Point.x"
d50 :: T44 -> MAlonzo.Code.Fin.T2
d50 v0
  = case coe v0 of
      C54 v1 v2 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
name52 = "Main.Point.y"
d52 :: T44 -> MAlonzo.Code.Fin.T2
d52 v0
  = case coe v0 of
      C54 v1 v2 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
name56 = "Main.Direction"
d56 = ()
data T56 = C58 | C60
name64 = "Main.Dec"
d64 a0 = ()
data T64 = C68 AgdaAny | C70
name72 = "Main.Target"
d72 = ()
data T72 = C82 MAlonzo.Code.Fin.T2 T44
name78 = "Main.Target.health"
d78 :: T72 -> MAlonzo.Code.Fin.T2
d78 v0
  = case coe v0 of
      C82 v1 v2 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
name80 = "Main.Target.position"
d80 :: T72 -> T44
d80 v0
  = case coe v0 of
      C82 v1 v2 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
name84 = "Main.m1"
d84 :: T72
d84
  = coe
      C82 (coe MAlonzo.Code.Fin.C10 (coe MAlonzo.Code.Fin.C6))
      (coe
         C54 (coe MAlonzo.Code.Fin.C10 (coe MAlonzo.Code.Fin.C6))
         (coe MAlonzo.Code.Fin.C6))
name86 = "Main.m3"
d86 :: T72
d86
  = coe
      C82
      (coe
         MAlonzo.Code.Fin.C10
         (coe
            MAlonzo.Code.Fin.C10
            (coe MAlonzo.Code.Fin.C10 (coe MAlonzo.Code.Fin.C6))))
      (coe
         C54
         (coe
            MAlonzo.Code.Fin.C10
            (coe
               MAlonzo.Code.Fin.C10
               (coe
                  MAlonzo.Code.Fin.C10
                  (coe
                     MAlonzo.Code.Fin.C10
                     (coe
                        MAlonzo.Code.Fin.C10
                        (coe
                           MAlonzo.Code.Fin.C10
                           (coe MAlonzo.Code.Fin.C10 (coe MAlonzo.Code.Fin.C6))))))))
         (coe MAlonzo.Code.Fin.C6))
name88 = "Main.Game"
d88 = ()
data T88 = C114 T44 T56 [T44] [T72] Bool Integer
name102 = "Main.Game.player"
d102 :: T88 -> T44
d102 v0
  = case coe v0 of
      C114 v1 v2 v3 v4 v5 v6 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
name104 = "Main.Game.direction"
d104 :: T88 -> T56
d104 v0
  = case coe v0 of
      C114 v1 v2 v3 v4 v5 v6 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
name106 = "Main.Game.bullet"
d106 :: T88 -> [T44]
d106 v0
  = case coe v0 of
      C114 v1 v2 v3 v4 v5 v6 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
name108 = "Main.Game.monster"
d108 :: T88 -> [T72]
d108 v0
  = case coe v0 of
      C114 v1 v2 v3 v4 v5 v6 -> coe v4
      _ -> MAlonzo.RTE.mazUnreachableError
name110 = "Main.Game.dead"
d110 :: T88 -> Bool
d110 v0
  = case coe v0 of
      C114 v1 v2 v3 v4 v5 v6 -> coe v5
      _ -> MAlonzo.RTE.mazUnreachableError
name112 = "Main.Game.score"
d112 :: T88 -> Integer
d112 v0
  = case coe v0 of
      C114 v1 v2 v3 v4 v5 v6 -> coe v6
      _ -> MAlonzo.RTE.mazUnreachableError
name116 = "Main.dir-initial"
d116 :: MAlonzo.Code.App.T2 -> T88
d116 v0 = du116
du116 :: T88
du116
  = coe
      C114
      (coe
         C54 (coe MAlonzo.Code.Fin.C6)
         (coe
            MAlonzo.Code.Fin.C10
            (coe
               MAlonzo.Code.Fin.C10
               (coe
                  MAlonzo.Code.Fin.C10
                  (coe
                     MAlonzo.Code.Fin.C10
                     (coe
                        MAlonzo.Code.Fin.C10
                        (coe
                           MAlonzo.Code.Fin.C10
                           (coe MAlonzo.Code.Fin.C10 (coe MAlonzo.Code.Fin.C6)))))))))
      (coe C60) (coe MAlonzo.Code.Agda.Builtin.List.C16)
      (coe
         MAlonzo.Code.Agda.Builtin.List.C22 (coe d84)
         (coe MAlonzo.Code.Agda.Builtin.List.C16))
      (coe MAlonzo.Code.Agda.Builtin.Bool.C8) (coe (0 :: Integer))
name120 = "Main.empty-row"
d120 :: Integer -> [MAlonzo.Code.Agda.Builtin.Char.T6]
d120 v0
  = case coe v0 of
      0 -> coe MAlonzo.Code.Agda.Builtin.List.C16
      _ -> let v1 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             MAlonzo.Code.Agda.Builtin.List.C22 (coe ' ') (coe d120 (coe v1))
name124 = "Main.empty-grid"
d124 :: Integer -> Integer -> [[MAlonzo.Code.Agda.Builtin.Char.T6]]
d124 v0 v1
  = case coe v0 of
      0 -> coe
             MAlonzo.Code.Agda.Builtin.List.C22
             (coe
                MAlonzo.Code.Agda.Builtin.List.C22 (coe ' ')
                (coe MAlonzo.Code.Agda.Builtin.List.C16))
             (coe MAlonzo.Code.Agda.Builtin.List.C16)
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             MAlonzo.Code.Agda.Builtin.List.C22 (coe d120 (coe v1))
             (coe d124 (coe v2) (coe v1))
name130 = "Main.modify-row"
d130 ::
  Integer ->
  MAlonzo.Code.Agda.Builtin.Char.T6 ->
  [MAlonzo.Code.Agda.Builtin.Char.T6] ->
  [MAlonzo.Code.Agda.Builtin.Char.T6]
d130 v0 v1 v2
  = case coe v2 of
      [] -> coe v2
      (:) v3 v4
        -> case coe v0 of
             0 -> coe MAlonzo.Code.Agda.Builtin.List.C22 (coe v1) (coe v4)
             _ -> let v5 = subInt (coe v0) (coe (1 :: Integer)) in
                  coe
                    MAlonzo.Code.Agda.Builtin.List.C22 (coe v3)
                    (coe d130 (coe v5) (coe v1) (coe v4))
      _ -> MAlonzo.RTE.mazUnreachableError
name146 = "Main.modify-grid"
d146 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Char.T6 ->
  [[MAlonzo.Code.Agda.Builtin.Char.T6]] ->
  [[MAlonzo.Code.Agda.Builtin.Char.T6]]
d146 v0 v1 v2 v3
  = case coe v3 of
      [] -> coe v3
      (:) v4 v5
        -> case coe v0 of
             0 -> coe
                    MAlonzo.Code.Agda.Builtin.List.C22
                    (coe d130 (coe v1) (coe v2) (coe v4)) (coe v5)
             _ -> let v6 = subInt (coe v0) (coe (1 :: Integer)) in
                  coe
                    MAlonzo.Code.Agda.Builtin.List.C22 (coe v4)
                    (coe d146 (coe v6) (coe v1) (coe v2) (coe v5))
      _ -> MAlonzo.RTE.mazUnreachableError
name168 = "Main.convertNat"
d168 :: Integer -> MAlonzo.Code.Fin.T2 -> Integer
d168 v0 v1 = du168 v1
du168 :: MAlonzo.Code.Fin.T2 -> Integer
du168 v0
  = case coe v0 of
      MAlonzo.Code.Fin.C6 -> coe (0 :: Integer)
      MAlonzo.Code.Fin.C10 v2
        -> coe addInt (coe (1 :: Integer)) (coe du168 (coe v2))
      _ -> MAlonzo.RTE.mazUnreachableError
name172 = "Main.safeIncrement"
d172 :: MAlonzo.Code.Fin.T2 -> MAlonzo.Code.Fin.T2
d172 v0
  = case coe v0 of
      MAlonzo.Code.Fin.C6
        -> coe MAlonzo.Code.Fin.C10 (coe MAlonzo.Code.Fin.C6)
      MAlonzo.Code.Fin.C10 v2
        -> case coe v2 of
             MAlonzo.Code.Fin.C6
               -> coe
                    MAlonzo.Code.Fin.C10
                    (coe MAlonzo.Code.Fin.C10 (coe MAlonzo.Code.Fin.C6))
             MAlonzo.Code.Fin.C10 v4
               -> case coe v4 of
                    MAlonzo.Code.Fin.C6
                      -> coe
                           MAlonzo.Code.Fin.C10
                           (coe
                              MAlonzo.Code.Fin.C10
                              (coe MAlonzo.Code.Fin.C10 (coe MAlonzo.Code.Fin.C6)))
                    MAlonzo.Code.Fin.C10 v6
                      -> case coe v6 of
                           MAlonzo.Code.Fin.C6
                             -> coe
                                  MAlonzo.Code.Fin.C10
                                  (coe
                                     MAlonzo.Code.Fin.C10
                                     (coe
                                        MAlonzo.Code.Fin.C10
                                        (coe MAlonzo.Code.Fin.C10 (coe MAlonzo.Code.Fin.C6))))
                           MAlonzo.Code.Fin.C10 v8
                             -> case coe v8 of
                                  MAlonzo.Code.Fin.C6
                                    -> coe
                                         MAlonzo.Code.Fin.C10
                                         (coe
                                            MAlonzo.Code.Fin.C10
                                            (coe
                                               MAlonzo.Code.Fin.C10
                                               (coe
                                                  MAlonzo.Code.Fin.C10
                                                  (coe
                                                     MAlonzo.Code.Fin.C10
                                                     (coe MAlonzo.Code.Fin.C6)))))
                                  MAlonzo.Code.Fin.C10 v10
                                    -> case coe v10 of
                                         MAlonzo.Code.Fin.C6
                                           -> coe
                                                MAlonzo.Code.Fin.C10
                                                (coe
                                                   MAlonzo.Code.Fin.C10
                                                   (coe
                                                      MAlonzo.Code.Fin.C10
                                                      (coe
                                                         MAlonzo.Code.Fin.C10
                                                         (coe
                                                            MAlonzo.Code.Fin.C10
                                                            (coe
                                                               MAlonzo.Code.Fin.C10
                                                               (coe MAlonzo.Code.Fin.C6))))))
                                         MAlonzo.Code.Fin.C10 v12
                                           -> case coe v12 of
                                                MAlonzo.Code.Fin.C6
                                                  -> coe
                                                       MAlonzo.Code.Fin.C10
                                                       (coe
                                                          MAlonzo.Code.Fin.C10
                                                          (coe
                                                             MAlonzo.Code.Fin.C10
                                                             (coe
                                                                MAlonzo.Code.Fin.C10
                                                                (coe
                                                                   MAlonzo.Code.Fin.C10
                                                                   (coe
                                                                      MAlonzo.Code.Fin.C10
                                                                      (coe
                                                                         MAlonzo.Code.Fin.C10
                                                                         (coe
                                                                            MAlonzo.Code.Fin.C6)))))))
                                                MAlonzo.Code.Fin.C10 v14
                                                  -> case coe v14 of
                                                       MAlonzo.Code.Fin.C6
                                                         -> coe
                                                              MAlonzo.Code.Fin.C10
                                                              (coe
                                                                 MAlonzo.Code.Fin.C10
                                                                 (coe
                                                                    MAlonzo.Code.Fin.C10
                                                                    (coe
                                                                       MAlonzo.Code.Fin.C10
                                                                       (coe
                                                                          MAlonzo.Code.Fin.C10
                                                                          (coe
                                                                             MAlonzo.Code.Fin.C10
                                                                             (coe
                                                                                MAlonzo.Code.Fin.C10
                                                                                (coe
                                                                                   MAlonzo.Code.Fin.C10
                                                                                   (coe
                                                                                      MAlonzo.Code.Fin.C6))))))))
                                                       MAlonzo.Code.Fin.C10 v16
                                                         -> case coe v16 of
                                                              MAlonzo.Code.Fin.C6
                                                                -> coe
                                                                     MAlonzo.Code.Fin.C10
                                                                     (coe
                                                                        MAlonzo.Code.Fin.C10
                                                                        (coe
                                                                           MAlonzo.Code.Fin.C10
                                                                           (coe
                                                                              MAlonzo.Code.Fin.C10
                                                                              (coe
                                                                                 MAlonzo.Code.Fin.C10
                                                                                 (coe
                                                                                    MAlonzo.Code.Fin.C10
                                                                                    (coe
                                                                                       MAlonzo.Code.Fin.C10
                                                                                       (coe
                                                                                          MAlonzo.Code.Fin.C10
                                                                                          (coe
                                                                                             MAlonzo.Code.Fin.C10
                                                                                             (coe
                                                                                                MAlonzo.Code.Fin.C6)))))))))
                                                              MAlonzo.Code.Fin.C10 v18
                                                                -> coe
                                                                     seq (coe v18)
                                                                     (coe
                                                                        MAlonzo.Code.Fin.C10
                                                                        (coe
                                                                           MAlonzo.Code.Fin.C10
                                                                           (coe
                                                                              MAlonzo.Code.Fin.C10
                                                                              (coe
                                                                                 MAlonzo.Code.Fin.C10
                                                                                 (coe
                                                                                    MAlonzo.Code.Fin.C10
                                                                                    (coe
                                                                                       MAlonzo.Code.Fin.C10
                                                                                       (coe
                                                                                          MAlonzo.Code.Fin.C10
                                                                                          (coe
                                                                                             MAlonzo.Code.Fin.C10
                                                                                             (coe
                                                                                                MAlonzo.Code.Fin.C10
                                                                                                (coe
                                                                                                   MAlonzo.Code.Fin.C6))))))))))
                                                              _ -> MAlonzo.RTE.mazUnreachableError
                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                _ -> MAlonzo.RTE.mazUnreachableError
                                         _ -> MAlonzo.RTE.mazUnreachableError
                                  _ -> MAlonzo.RTE.mazUnreachableError
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name174 = "Main.safeDecrement"
d174 :: MAlonzo.Code.Fin.T2 -> MAlonzo.Code.Fin.T2
d174 v0
  = case coe v0 of
      MAlonzo.Code.Fin.C6 -> coe MAlonzo.Code.Fin.C6
      MAlonzo.Code.Fin.C10 v2
        -> case coe v2 of
             MAlonzo.Code.Fin.C6 -> coe MAlonzo.Code.Fin.C6
             MAlonzo.Code.Fin.C10 v4
               -> case coe v4 of
                    MAlonzo.Code.Fin.C6
                      -> coe MAlonzo.Code.Fin.C10 (coe MAlonzo.Code.Fin.C6)
                    MAlonzo.Code.Fin.C10 v6
                      -> case coe v6 of
                           MAlonzo.Code.Fin.C6
                             -> coe
                                  MAlonzo.Code.Fin.C10
                                  (coe MAlonzo.Code.Fin.C10 (coe MAlonzo.Code.Fin.C6))
                           MAlonzo.Code.Fin.C10 v8
                             -> case coe v8 of
                                  MAlonzo.Code.Fin.C6
                                    -> coe
                                         MAlonzo.Code.Fin.C10
                                         (coe
                                            MAlonzo.Code.Fin.C10
                                            (coe MAlonzo.Code.Fin.C10 (coe MAlonzo.Code.Fin.C6)))
                                  MAlonzo.Code.Fin.C10 v10
                                    -> case coe v10 of
                                         MAlonzo.Code.Fin.C6
                                           -> coe
                                                MAlonzo.Code.Fin.C10
                                                (coe
                                                   MAlonzo.Code.Fin.C10
                                                   (coe
                                                      MAlonzo.Code.Fin.C10
                                                      (coe
                                                         MAlonzo.Code.Fin.C10
                                                         (coe MAlonzo.Code.Fin.C6))))
                                         MAlonzo.Code.Fin.C10 v12
                                           -> case coe v12 of
                                                MAlonzo.Code.Fin.C6
                                                  -> coe
                                                       MAlonzo.Code.Fin.C10
                                                       (coe
                                                          MAlonzo.Code.Fin.C10
                                                          (coe
                                                             MAlonzo.Code.Fin.C10
                                                             (coe
                                                                MAlonzo.Code.Fin.C10
                                                                (coe
                                                                   MAlonzo.Code.Fin.C10
                                                                   (coe MAlonzo.Code.Fin.C6)))))
                                                MAlonzo.Code.Fin.C10 v14
                                                  -> case coe v14 of
                                                       MAlonzo.Code.Fin.C6
                                                         -> coe
                                                              MAlonzo.Code.Fin.C10
                                                              (coe
                                                                 MAlonzo.Code.Fin.C10
                                                                 (coe
                                                                    MAlonzo.Code.Fin.C10
                                                                    (coe
                                                                       MAlonzo.Code.Fin.C10
                                                                       (coe
                                                                          MAlonzo.Code.Fin.C10
                                                                          (coe
                                                                             MAlonzo.Code.Fin.C10
                                                                             (coe
                                                                                MAlonzo.Code.Fin.C6))))))
                                                       MAlonzo.Code.Fin.C10 v16
                                                         -> case coe v16 of
                                                              MAlonzo.Code.Fin.C6
                                                                -> coe
                                                                     MAlonzo.Code.Fin.C10
                                                                     (coe
                                                                        MAlonzo.Code.Fin.C10
                                                                        (coe
                                                                           MAlonzo.Code.Fin.C10
                                                                           (coe
                                                                              MAlonzo.Code.Fin.C10
                                                                              (coe
                                                                                 MAlonzo.Code.Fin.C10
                                                                                 (coe
                                                                                    MAlonzo.Code.Fin.C10
                                                                                    (coe
                                                                                       MAlonzo.Code.Fin.C10
                                                                                       (coe
                                                                                          MAlonzo.Code.Fin.C6)))))))
                                                              MAlonzo.Code.Fin.C10 v18
                                                                -> coe
                                                                     seq (coe v18)
                                                                     (coe
                                                                        MAlonzo.Code.Fin.C10
                                                                        (coe
                                                                           MAlonzo.Code.Fin.C10
                                                                           (coe
                                                                              MAlonzo.Code.Fin.C10
                                                                              (coe
                                                                                 MAlonzo.Code.Fin.C10
                                                                                 (coe
                                                                                    MAlonzo.Code.Fin.C10
                                                                                    (coe
                                                                                       MAlonzo.Code.Fin.C10
                                                                                       (coe
                                                                                          MAlonzo.Code.Fin.C10
                                                                                          (coe
                                                                                             MAlonzo.Code.Fin.C10
                                                                                             (coe
                                                                                                MAlonzo.Code.Fin.C6)))))))))
                                                              _ -> MAlonzo.RTE.mazUnreachableError
                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                _ -> MAlonzo.RTE.mazUnreachableError
                                         _ -> MAlonzo.RTE.mazUnreachableError
                                  _ -> MAlonzo.RTE.mazUnreachableError
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name176 = "Main.drawBullets"
d176 ::
  [T44] ->
  [[MAlonzo.Code.Agda.Builtin.Char.T6]] ->
  [[MAlonzo.Code.Agda.Builtin.Char.T6]]
d176 v0 v1
  = case coe v0 of
      [] -> coe v1
      (:) v2 v3
        -> case coe v2 of
             C54 v4 v5
               -> coe
                    d176 (coe v3)
                    (coe
                       d146 (coe du168 (coe v5)) (coe du168 (coe v4)) (coe '^') (coe v1))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name188 = "Main.moveBullets"
d188 :: [T44] -> [T44]
d188 v0
  = case coe v0 of
      [] -> coe v0
      (:) v1 v2
        -> case coe v1 of
             C54 v3 v4
               -> coe
                    MAlonzo.Code.Agda.Builtin.List.C22
                    (coe
                       C54 (coe v3)
                       (coe MAlonzo.Code.Fin.d26 (coe (10 :: Integer)) (coe v4)))
                    (coe d188 (coe v2))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name196 = "Main.mHealth"
d196 :: MAlonzo.Code.Fin.T2 -> MAlonzo.Code.Agda.Builtin.Char.T6
d196 v0
  = let v1 = coe du168 (coe v0) in
    case coe v1 of
      3 -> coe 'M'
      _ | coe geqInt (coe v1) (coe (3 :: Integer)) -> coe 'm'
      2 -> coe 'm'
      1 -> coe 'm'
      _ -> coe 'm'
name208 = "Main.drawMonsters"
d208 ::
  [T72] ->
  [[MAlonzo.Code.Agda.Builtin.Char.T6]] ->
  [[MAlonzo.Code.Agda.Builtin.Char.T6]]
d208 v0 v1
  = case coe v0 of
      [] -> coe v1
      (:) v2 v3
        -> coe
             d208 (coe v3)
             (coe
                d146 (coe du168 (coe d52 (coe d80 (coe v2))))
                (coe du168 (coe d50 (coe d80 (coe v2))))
                (coe d196 (coe d78 (coe v2))) (coe v1))
      _ -> MAlonzo.RTE.mazUnreachableError
name218 = "Main.dir-draw"
d218 :: T88 -> [[MAlonzo.Code.Agda.Builtin.Char.T6]]
d218 v0
  = case coe v0 of
      C114 v1 v2 v3 v4 v5 v6
        -> case coe v1 of
             C54 v7 v8
               -> coe
                    d176 (coe v3)
                    (coe
                       d208 (coe v4)
                       (coe
                          d146 (coe du168 (coe v8)) (coe du168 (coe v7)) (coe 'P')
                          (coe d124 (coe (10 :: Integer)) (coe (10 :: Integer)))))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name234 = "Main.moveM"
d234 :: T72 -> T72
d234 v0
  = case coe v0 of
      C82 v1 v2
        -> case coe v2 of
             C54 v3 v4
               -> coe
                    C82 (coe v1)
                    (coe
                       C54 (coe v3)
                       (coe MAlonzo.Code.Fin.d58 (coe (9 :: Integer)) (coe v4)))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name242 = "Main.moveMonsters"
d242 :: [T72] -> [T72]
d242 v0
  = case coe v0 of
      [] -> coe v0
      (:) v1 v2
        -> coe
             MAlonzo.Code.Agda.Builtin.List.C22 (coe d234 (coe v1))
             (coe d242 (coe v2))
      _ -> MAlonzo.RTE.mazUnreachableError
name248 = "Main._∧_"
d248 :: Bool -> Bool -> Bool
d248 v0 v1
  = let v2 = coe MAlonzo.Code.Agda.Builtin.Bool.C8 in
    case coe v0 of
      MAlonzo.Code.Agda.Builtin.Bool.C10
        -> case coe v1 of
             MAlonzo.Code.Agda.Builtin.Bool.C10 -> coe v1
             _ -> coe v2
      _ -> coe v2
name250 = "Main._∨_"
d250 :: Bool -> Bool -> Bool
d250 v0 v1 = if coe v0 then coe v0 else coe v1
name254 = "Main.GameOver"
d254 :: Integer -> Bool
d254 v0
  = let v1 = coe MAlonzo.Code.Agda.Builtin.Bool.C10 in
    case coe v0 of
      0 -> coe MAlonzo.Code.Agda.Builtin.Bool.C8
      1 -> coe MAlonzo.Code.Agda.Builtin.Bool.C8
      2 -> coe MAlonzo.Code.Agda.Builtin.Bool.C8
      3 -> coe MAlonzo.Code.Agda.Builtin.Bool.C8
      4 -> coe MAlonzo.Code.Agda.Builtin.Bool.C8
      _ -> coe v1
name256 = "Main.decreaseHealth"
d256 :: T72 -> T72
d256 v0
  = case coe v0 of
      C82 v1 v2
        -> let v3 = coe du168 (coe v1) in
           case coe v3 of
             0 -> coe v0
             1 -> coe C82 (coe MAlonzo.Code.Fin.C6) (coe v2)
             2 -> coe
                    C82 (coe MAlonzo.Code.Fin.C10 (coe MAlonzo.Code.Fin.C6)) (coe v2)
             3 -> coe
                    C82
                    (coe
                       MAlonzo.Code.Fin.C10
                       (coe MAlonzo.Code.Fin.C10 (coe MAlonzo.Code.Fin.C6)))
                    (coe v2)
             _ -> coe v0
      _ -> MAlonzo.RTE.mazUnreachableError
name286 = "Main.monsterHealth"
d286 :: Bool -> T72 -> T72
d286 v0 v1
  = if coe v0 then coe seq (coe v1) (coe d256 (coe v1)) else coe v1
name296 = "Main.pointEq"
d296 :: T44 -> T44 -> Bool
d296 v0 v1
  = case coe v0 of
      C54 v2 v3
        -> case coe v1 of
             C54 v4 v5
               -> coe
                    d248 (coe eqInt (coe du168 (coe v2)) (coe du168 (coe v4)))
                    (coe eqInt (coe du168 (coe v3)) (coe du168 (coe v5)))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name306 = "Main.switchMonster"
d306 :: T72 -> T72
d306 v0
  = let v1 = d296 (coe d80 (coe v0)) (coe d80 (coe d84)) in
    if coe v1 then coe d86 else coe d84
name318 = "Main.hitMonster"
d318 :: T44 -> [T72] -> Bool
d318 v0 v1
  = case coe v1 of
      [] -> coe MAlonzo.Code.Agda.Builtin.Bool.C8
      (:) v2 v3
        -> let v4 = d296 (coe v0) (coe d80 (coe v2)) in
           if coe v4 then coe v4 else coe d318 (coe v0) (coe v3)
      _ -> MAlonzo.RTE.mazUnreachableError
name344 = "Main.bulletHitsTarget"
d344 :: [T44] -> T72 -> Bool
d344 v0 v1
  = case coe v0 of
      [] -> coe MAlonzo.Code.Agda.Builtin.Bool.C8
      (:) v2 v3
        -> coe
             d250 (coe d296 (coe v2) (coe d80 (coe v1)))
             (coe d344 (coe v3) (coe v1))
      _ -> MAlonzo.RTE.mazUnreachableError
name354 = "Main.isZeroHealth"
d354 :: MAlonzo.Code.Fin.T2 -> Bool
d354 v0
  = let v1 = coe du168 (coe v0) in
    case coe v1 of
      0 -> coe MAlonzo.Code.Agda.Builtin.Bool.C10
      _ -> coe MAlonzo.Code.Agda.Builtin.Bool.C8
name366 = "Main.processHit"
d366 :: T72 -> T72
d366 v0
  = let v1
          = d354
              (coe
                 d78
                 (coe d286 (coe MAlonzo.Code.Agda.Builtin.Bool.C10) (coe v0))) in
    if coe v1
      then coe d306 (coe v0)
      else coe d286 (coe MAlonzo.Code.Agda.Builtin.Bool.C10) (coe v0)
name378 = "Main.updateMonsters"
d378 :: [T72] -> [T44] -> [T72]
d378 v0 v1
  = case coe v0 of
      [] -> coe v0
      (:) v2 v3
        -> let v4 = d344 (coe v1) (coe v2) in
           if coe v4
             then coe
                    MAlonzo.Code.Agda.Builtin.List.C22 (coe d366 (coe v2))
                    (coe d378 (coe v3) (coe v1))
             else coe
                    MAlonzo.Code.Agda.Builtin.List.C22 (coe v2)
                    (coe d378 (coe v3) (coe v1))
      _ -> MAlonzo.RTE.mazUnreachableError
name402 = "Main.removeBullet"
d402 :: T44 -> [T44] -> [T44]
d402 v0 v1
  = case coe v1 of
      [] -> coe v1
      (:) v2 v3
        -> let v4 = d296 (coe v0) (coe v2) in
           if coe v4
             then coe v3
             else coe
                    MAlonzo.Code.Agda.Builtin.List.C22 (coe v2)
                    (coe d402 (coe v0) (coe v3))
      _ -> MAlonzo.RTE.mazUnreachableError
name428 = "Main.removeBulletGrid"
d428 :: [T44] -> [T44]
d428 v0
  = case coe v0 of
      [] -> coe v0
      (:) v1 v2
        -> case coe v1 of
             C54 v3 v4
               -> let v5 = coe du168 (coe v4) in
                  let v6
                        = coe
                            MAlonzo.Code.Agda.Builtin.List.C22 (coe v1) (coe d428 (coe v2)) in
                  case coe v5 of
                    0 -> coe d428 (coe v2)
                    _ -> coe v6
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name452 = "Main.handle-hit"
d452 ::
  T44 -> T56 -> [T44] -> T72 -> [T72] -> Bool -> Integer -> T88
d452 v0 v1 v2 v3 v4 v5 v6 = du452 v0 v1 v2 v3 v4 v6
du452 :: T44 -> T56 -> [T44] -> T72 -> [T72] -> Integer -> T88
du452 v0 v1 v2 v3 v4 v5
  = coe
      seq (coe v0)
      (coe
         C114 (coe v0) (coe v1)
         (coe d188 (coe d402 (coe d80 (coe v3)) (coe v2)))
         (coe
            MAlonzo.Code.Agda.Builtin.List.C22 (coe d366 (coe v3)) (coe v4))
         (coe d254 (coe addInt (coe (1 :: Integer)) (coe v5)))
         (coe addInt (coe (1 :: Integer)) (coe v5)))
name474 = "Main.hitMonster'"
d474 :: T44 -> [T72] -> MAlonzo.Code.Fin.T32
d474 v0 v1
  = case coe v1 of
      [] -> coe MAlonzo.Code.Fin.C36
      (:) v2 v3
        -> let v4 = d296 (coe v0) (coe d80 (coe v2)) in
           if coe v4
             then coe
                    MAlonzo.Code.Fin.C38
                    (coe
                       MAlonzo.Code.Agda.Builtin.List.C22 (coe d366 (coe v2)) (coe v3))
             else coe d474 (coe v0) (coe v3)
      _ -> MAlonzo.RTE.mazUnreachableError
name500 = "Main.handle-all"
d500 :: [T44] -> [T72] -> T22
d500 v0 v1
  = case coe v0 of
      [] -> coe C28 (coe v0) (coe v1)
      (:) v2 v3
        -> let v4 = d474 (coe v2) (coe v1) in
           case coe v4 of
             MAlonzo.Code.Fin.C36
               -> let v5 = d500 (coe v3) (coe v1) in
                  case coe v5 of
                    C28 v6 v7
                      -> coe
                           C28 (coe MAlonzo.Code.Agda.Builtin.List.C22 (coe v2) (coe v6))
                           (coe v7)
                    _ -> MAlonzo.RTE.mazUnreachableError
             MAlonzo.Code.Fin.C38 v5 -> coe d500 (coe v3) (coe v5)
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name542 = "Main.handle-tick"
d542 :: T88 -> T88
d542 v0
  = case coe v0 of
      C114 v1 v2 v3 v4 v5 v6
        -> coe
             seq (coe v1)
             (coe
                seq (coe v2)
                (let v7 = d500 (coe v3) (coe v4) in
                 case coe v7 of
                   C28 v8 v9
                     -> coe
                          C114 (coe v1) (coe v2) (coe d428 (coe d188 (coe v8)))
                          (coe d242 (coe v9)) (coe d254 (coe v6)) (coe v6)
                   _ -> MAlonzo.RTE.mazUnreachableError))
      _ -> MAlonzo.RTE.mazUnreachableError
name608 = "Main.dir-handle"
d608 :: MAlonzo.Code.App.T6 -> T88 -> T88
d608 v0 v1
  = case coe v0 of
      MAlonzo.Code.App.C8
        -> case coe v1 of
             C114 v2 v3 v4 v5 v6 v7
               -> case coe v2 of
                    C54 v8 v9
                      -> coe
                           C114 (coe C54 (coe d174 (coe v8)) (coe v9)) (coe C58) (coe v4)
                           (coe v5) (coe d254 (coe v7)) (coe v7)
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      MAlonzo.Code.App.C10
        -> case coe v1 of
             C114 v2 v3 v4 v5 v6 v7
               -> case coe v2 of
                    C54 v8 v9
                      -> coe
                           C114 (coe C54 (coe d172 (coe v8)) (coe v9)) (coe C60) (coe v4)
                           (coe v5) (coe d254 (coe v7)) (coe v7)
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      MAlonzo.Code.App.C12
        -> case coe v1 of
             C114 v2 v3 v4 v5 v6 v7
               -> coe
                    d542
                    (coe
                       C114 (coe v2) (coe v3) (coe v4) (coe v5) (coe d254 (coe v7))
                       (coe v7))
             _ -> MAlonzo.RTE.mazUnreachableError
      MAlonzo.Code.App.C14
        -> case coe v1 of
             C114 v2 v3 v4 v5 v6 v7
               -> case coe v2 of
                    C54 v8 v9
                      -> coe
                           C114 (coe v2) (coe v3)
                           (coe
                              MAlonzo.Code.Agda.Builtin.List.C22
                              (coe
                                 C54 (coe v8)
                                 (coe MAlonzo.Code.Fin.d26 (coe (10 :: Integer)) (coe v9)))
                              (coe v4))
                           (coe v5) (coe d254 (coe v7)) (coe v7)
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name660 = "Main.app-dir"
d660 :: MAlonzo.Code.App.T16
d660
  = coe
      MAlonzo.Code.App.C34
      (\ v0 ->
         coe
           C114
           (coe
              C54 (coe MAlonzo.Code.Fin.C6)
              (coe
                 MAlonzo.Code.Fin.C10
                 (coe
                    MAlonzo.Code.Fin.C10
                    (coe
                       MAlonzo.Code.Fin.C10
                       (coe
                          MAlonzo.Code.Fin.C10
                          (coe
                             MAlonzo.Code.Fin.C10
                             (coe
                                MAlonzo.Code.Fin.C10
                                (coe MAlonzo.Code.Fin.C10 (coe MAlonzo.Code.Fin.C6)))))))))
           (coe C60) (coe MAlonzo.Code.Agda.Builtin.List.C16)
           (coe
              MAlonzo.Code.Agda.Builtin.List.C22 (coe d84)
              (coe MAlonzo.Code.Agda.Builtin.List.C16))
           (coe MAlonzo.Code.Agda.Builtin.Bool.C8) (coe (0 :: Integer)))
      d218 d608
main = coe d662
name662 = "Main.main"
d662 ::
  MAlonzo.Code.Agda.Builtin.IO.T8
    AgdaAny MAlonzo.Code.Agda.Builtin.Unit.T6
d662
  = coe MAlonzo.Code.App.d78 (coe (1000000 :: Integer)) (coe d660)
