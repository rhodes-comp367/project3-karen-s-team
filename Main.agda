module Main where
module Logic where
module Fin where

open import Agda.Builtin.Char
open import Agda.Builtin.IO
open import Agda.Builtin.List
open import Agda.Builtin.Unit
open import Agda.Builtin.Bool
open import Agda.Builtin.Nat 
open import Agda.Builtin.Equality
open import Agda.Builtin.Equality
--open import Data.List
open import App
open import Fin
module Main where

data ⊥ : Set where
¬ : Set → Set
¬ A = A → ⊥

~ : Set → Set
~ A = ¬ A

data _×_ (A B : Set) : Set where
  _,_ : A → B → A × B

data _⊔_ (A B : Set) : Set where
  left : A → A ⊔ B
  right : B → A ⊔ B

-- A pair of (x, y) coordinates.
record Point : Set where
  constructor
    _,_
  field
    x : Fin 10
    y : Fin 10

-- A direction; either left, right, up, or down.
data Direction : Set where
  left : Direction
  right : Direction
  --up : Direction 
  --down : Direction 
  

data Dec (P : Set) : Set where
  yes : P → Dec P
  no : ~ P → Dec P

--record type for Target
record Target : Set where
  constructor 
    target
  field
    health : Fin 4
    position : Point

--first monster's health and position 
m1 : Target
m1 = target (suc zero) (suc zero , zero) 

--second monster's health and position
m3 : Target
m3 = target (suc (suc (suc zero))) (suc (suc (suc (suc (suc (suc (suc zero)))))) , zero)


--record type for game app
record Game : Set where
  constructor
    game
  field
    player : Point
    direction : Direction
    bullet : List Point
    monster : List Target
    dead : Bool
    score : Nat

dir-initial : Gen → Game 
dir-initial x = game (zero , suc (suc (suc (suc (suc (suc (suc zero))))))) right [] (m1 ∷ []) false 0

empty-row : Nat → List Char
empty-row zero = []
empty-row (suc n) = ' ' ∷ empty-row n

empty-grid : Nat → Nat → List (List Char)
empty-grid zero _ = (' ' ∷ []) ∷ []
empty-grid (suc m) n = empty-row n ∷ empty-grid m n

modify-row : Nat → Char → List Char → List Char
modify-row _ _ [] = []
modify-row zero c (x ∷ xs) = c ∷ xs
modify-row (suc n) c (x ∷ xs) = x ∷ modify-row n c xs

modify-grid : Nat → Nat → Char → List (List Char) → List (List Char)
modify-grid _ _ _ [] = []
modify-grid zero n c (r ∷ rs) = modify-row n c r ∷ rs
modify-grid (suc m) n c (r ∷ rs) = r ∷ modify-grid m n c rs

--helper to convert fin type to nat type for draw function 
convertNat : ∀ {n} → Fin n → Nat
convertNat zero = zero
convertNat (suc x) = suc (convertNat x)

--have player stay in bounds when incrementing on grid
safeIncrement : Fin 10 → Fin 10
safeIncrement zero = suc zero
safeIncrement (suc zero) = suc (suc zero)
safeIncrement (suc (suc zero)) = suc (suc (suc zero))
safeIncrement (suc (suc (suc zero))) = suc (suc (suc (suc zero)))
safeIncrement (suc (suc (suc (suc zero)))) = suc (suc (suc (suc (suc zero))))
safeIncrement (suc (suc (suc (suc (suc zero))))) = suc (suc (suc (suc (suc (suc zero)))))
safeIncrement (suc (suc (suc (suc (suc (suc zero)))))) = suc (suc (suc (suc (suc (suc (suc zero))))))
safeIncrement (suc (suc (suc (suc (suc (suc (suc zero))))))) = suc (suc (suc (suc (suc (suc (suc (suc zero)))))))
safeIncrement (suc (suc (suc (suc (suc (suc (suc (suc zero)))))))) = suc (suc (suc (suc (suc (suc (suc (suc (suc zero))))))))
safeIncrement (suc (suc (suc (suc (suc (suc (suc (suc (suc zero))))))))) = suc (suc (suc (suc (suc (suc (suc (suc (suc zero))))))))

--have player stay in bounds when decrementing on grid
safeDecrement : Fin 10 → Fin 10
safeDecrement zero = zero
safeDecrement (suc zero) = zero
safeDecrement (suc (suc zero)) = suc zero
safeDecrement (suc (suc (suc zero))) = suc (suc zero)
safeDecrement (suc (suc (suc (suc zero)))) = suc (suc (suc zero))
safeDecrement (suc (suc (suc (suc (suc zero))))) = suc (suc (suc (suc zero)))
safeDecrement (suc (suc (suc (suc (suc (suc zero)))))) = suc (suc (suc (suc (suc zero))))
safeDecrement (suc (suc (suc (suc (suc (suc (suc zero))))))) = suc (suc (suc (suc (suc (suc zero)))))
safeDecrement (suc (suc (suc (suc (suc (suc (suc (suc zero)))))))) = suc (suc (suc (suc (suc (suc (suc zero))))))
safeDecrement (suc (suc (suc (suc (suc (suc (suc (suc (suc zero))))))))) = suc (suc (suc (suc (suc (suc (suc (suc zero)))))))


--helper to draw bullets
drawBullets : List Point → List (List Char) → List (List Char)
drawBullets [] g = g
drawBullets ((bx , by) ∷ bs) g =
  drawBullets bs (modify-grid (convertNat by) (convertNat bx) '^' g)

--helper to move bullet up each tick
moveBullets : List Point → List Point
moveBullets [] = []
moveBullets ((x , y) ∷ ys) = (x , decrement y) ∷ moveBullets ys
-- moveBullets ((x , y) ∷ ys) with decrement' y
-- ... | nothing = moveBullets ys
-- ... | just y' = (x , y') ∷ moveBullets ys

--displays the monster based on their health
--M for health of 3 
--m for health less than 3
mHealth : Fin 4 → Char
mHealth h with convertNat h
... | 3 = 'M'
... | _ = 'm'

--helper for draw function
drawMonsters : List Target → List (List Char) → List (List Char)
drawMonsters [] y = y
drawMonsters (x ∷ xs) y = drawMonsters xs (modify-grid (convertNat (Point.y (Target.position x))) 
  (convertNat (Point.x (Target.position x))) (mHealth (Target.health x)) y)


--draws the grid based on the state of the game
--used ChatGPT for using mHealth idea
dir-draw : Game → List (List Char)
dir-draw (game (x , y) direction bullets monsters dead score) =
  drawBullets bullets
    (drawMonsters monsters
      (modify-grid (convertNat y) (convertNat x) 'P'
        (empty-grid 10 10)))

--move monster down
moveM : Target → Target 
moveM (target health (x , y)) = target health (x , increment y)

--helper to move all monsters down each tick
moveMonsters : List Target → List Target
moveMonsters [] = []
moveMonsters (x ∷ xs) = moveM x ∷ moveMonsters xs

--helper to make 2 points true 
_∧_ : Bool → Bool → Bool
true ∧ true = true
_ ∧ _ = false

_∨_ : Bool → Bool → Bool
true ∨ _ = true
false ∨ b = b

-- shows game is over when player scores more than 5 points
GameOver : Nat → Bool
GameOver zero = false
GameOver (suc zero) = false
GameOver (suc (suc zero)) = false
GameOver (suc (suc (suc zero))) = false
GameOver (suc (suc (suc (suc zero)))) = false
GameOver _ = true

--subtracts 1 from health
decreaseHealth : Target → Target
decreaseHealth (target h pos) with convertNat h
... | 0 = target h pos                             
... | 1 = target zero pos                          
... | 2 = target (suc zero) pos                    
... | 3 = target (suc (suc zero)) pos              
... | _ = target h pos                             

--if monster was hit, then substract from health
monsterHealth : Bool → Target → Target
monsterHealth false (target health position) = target health position
monsterHealth true (target health position) = decreaseHealth (target health position)

--helper to check if a point is equal to another point
pointEq : Point → Point → Bool
pointEq (x1 , y1) (x2 , y2) = (convertNat x1 == convertNat x2) ∧ (convertNat y1 == convertNat y2)

--helper to switch monster when one dies
switchMonster : Target → Target
switchMonster t with pointEq (Target.position t) (Target.position m1)
... | true = m3
... | false = m1

--uses PointEq to determine if it was hit
--returns if the monster was hit or not
hitMonster : Point → List Target → Bool
hitMonster p [] = false
hitMonster p (x ∷ xs) with pointEq p (Target.position x)
... | true = true
... | false = hitMonster p xs

--detects if a list of bullets equal the target point
--used https://plfa.github.io/Lists/ to understand how lists work
bulletHitsTarget : List Point → Target → Bool
bulletHitsTarget [] t = false
bulletHitsTarget (b ∷ bs) t = pointEq b (Target.position t) ∨ bulletHitsTarget bs t -- chekcks if the first point in the list 
                                                                                    -- or the remaining points are equal to bullet

-- helper to check if health is zero
isZeroHealth : Fin 4 → Bool
isZeroHealth h with convertNat h
... | 0 = true
... | _ = false

--helper to determine to switch or keep decreasing health
processHit : Target → Target
processHit t with isZeroHealth (Target.health (monsterHealth true t))
... | true  = switchMonster t
... | false = monsterHealth true t

--gives a list of monsters and a list of bullets
--if monster was hit, reduce its health once health is 0, replace it with the next monster
--i think the issue lies here where the monsters are not properly switching
--but im not sure why its not working since i call processHit once a hit is detected, which will switch monster if health is 0
--and otherwise it calls monsterhealth to keep decreasing health until its 0
--usedchat 
updateMonsters : List Target → List Point → List Target
updateMonsters [] _ = []
updateMonsters (x ∷ xs) bullets with bulletHitsTarget bullets x
... | true  = processHit x ∷ updateMonsters xs bullets
... | false = x ∷ updateMonsters xs bullets

--removes bullet if it hits monster
removeBullet : Point → List Point → List Point
removeBullet p [] = []
removeBullet p (x ∷ xs) with pointEq p x
... | true  = xs         -- if this is the bullet that hit, remove it
... | false = x ∷ removeBullet p xs

--removes bullet when it reaches top of the grid
removeBulletGrid : List Point → List Point 
removeBulletGrid [] = []
removeBulletGrid ((x , y) ∷ xs) with convertNat y
... | 0 = removeBulletGrid xs         --if y = 0 (top) then remove
... | _ = (x , y) ∷ removeBulletGrid xs  


--removes the bullet that hit the monster
--processes the hit if detected
--this function is not used anywhere in the code.
--i tried implementing this to try to get the scoring to work to use instead of handle-all
--used chatgpt to create this helper function and use it in handle-tick
--used https://agda.readthedocs.io/en/v2.5.2/language/let-and-where.html for help on formatting
handle-hit : Point → Direction → List Point → Target → List Target → Bool → Nat → Game
handle-hit (x , y) dir bullets t ts dead score =
  let 
    newScore = suc score
    isDead = GameOver newScore
  in
    game (x , y)
         dir
         (moveBullets (removeBullet (Target.position t) bullets))
         (processHit t ∷ ts)
         isDead
         newScore

-- if bullet hits monster, return `just` (new monster list).
-- if bullet doesn't hit monster, return `nothing`.
hitMonster' : Point → List Target → Maybe (List Target)
hitMonster' p [] = nothing
hitMonster' p (x ∷ xs) with pointEq p (Target.position x)
... | true = just (processHit x ∷ xs)
... | false = hitMonster' p xs

--checks if any bullets hit any monsters
--used https://agda.github.io/agda-stdlib/master/Data.Maybe.Base.html 
--and https://agda.readthedocs.io/en/v2.6.1/language/with-abstraction.html for formatting
handle-all : List Point → List Target → List Point × List Target
handle-all [] monsters = ([] , monsters)
handle-all (x ∷ xs) monsters with hitMonster' x monsters
  -- If the bullet hits a monster, update the monster list.
  -- I tried to add scoring logic here by using `suc game score`,
  -- with the idea that each time a monster is hit, the score should increase by 1.
  -- However, I couldn't successfully implement score tracking in this function yet.
... | just monsters' = handle-all xs monsters' 
... | nothing with handle-all xs monsters 
... | bullets , monsters' = (x ∷ bullets) , monsters'

-- Updates the game state on each tick
--used ChatGPT to help understand the order in which to call each function
handle-tick : Game → Game
handle-tick (game (x , y) left bullets targets dead score)
  with handle-all bullets targets
... | bullets' , targets' = game (x , y) left (removeBulletGrid (moveBullets bullets'))
   (moveMonsters targets') (GameOver score) score
-- I intended to implement the scoring logic here based on the collisions detected
-- in handle-all. But since i couldnt complete the scoring in handle-all, the scoring here doesnt work.

handle-tick (game (x , y) right bullets targets dead score)
  with handle-all bullets targets
... | bullets' , targets' = game (x , y) right (removeBulletGrid (moveBullets bullets'))
   (moveMonsters targets') (GameOver score) score


dir-handle : Event → Game → Game
dir-handle left (game (x , y) _ bullet monster dead score) = game (safeDecrement x , y) left bullet monster (GameOver score) score
dir-handle right (game (x , y) _ bullet monster dead score) = game (safeIncrement x , y) right bullet monster (GameOver score) score
dir-handle tick (game player direction bullet monster dead score) = handle-tick (game player direction bullet monster (GameOver score) score)
dir-handle space (game (x , y) direction bullet monster dead score) 
  = game (x , y) direction ((x , decrement y) ∷ bullet) monster (GameOver score) score --pressing space will add a bullet above the player

--app to run game app
app-dir : App
app-dir = record
  { State = Game
  ; initial = dir-initial
  ; draw = dir-draw
  ; handle = dir-handle
  }

main : IO ⊤
main = run 1000000 app-dir
              