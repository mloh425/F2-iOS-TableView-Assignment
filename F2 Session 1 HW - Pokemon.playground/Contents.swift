
import UIKit

//Storing only three types for simplicity, there are 18 types total
enum Type {
  case Fire, Water, Grass
}

class Pokemon {
  let name: String
  let type: Type
  var health: Double //Override on other levels
  var level: Int //Override if you want?
  var skills = [String] ()
  var isAlive: Bool = true
  var originalHealth = 0.0

  //Taking in the parameters of a (String) name, (Type) enum member, (Int) level,
  //(Double) health, this initializer will create an instance of a Pokemon object
  //with those attributes and stats.
  init (name: String, type: Type ,_ level: Int = 1, health: Double = 100.0) {
    self.name = name
    self.type = type
    self.level = level
    self.health = health
    self.originalHealth = health
  }
  
  
  //Each time it eats rare candy it levels up
  //and increases health by 20 hit points
  func eatRareCandy() {
    self.originalHealth += 20
    self.level++
  }
  
  //Checks to see if your Pokemon's health
  //is above 0, if it is then your Pokemon is
  //still alive, otherwise it sets isAlive to false.
  func alive() -> Bool {
    if (health == 0) {
      self.isAlive = false
      println("\(self.name) needs to go to the Pokemon Center!")
    } else {
      self.isAlive = true
    }
    return self.isAlive
  }
  
  //Restores the Pokemon's health to full hitpoints from 0.
  func goToPokemonCenter() {
    self.health = originalHealth
  }
  
  //This function is to prevent a Pokemon's health from reaching
  //a negative value when taking damage. If the damage done by the attack
  //is greater than how much health is left, then the Pokemon's
  //hitpoints will be set to zero and its isAlive property will be set to false.
  func checkEnemyHealthWithMultiplier (multiplier : Double, atkDmg: Double, healthLeft : Double, enemy : Pokemon){
    if healthLeft - (multiplier * atkDmg) > 0 {
      enemy.health -= (multiplier * atkDmg)
    } else {
      enemy.health = 0
      enemy.alive()
    }
  }
  
  //Takes in an enemy Pokemon and checks what their type is and 
  //depending on what type your current Pokemon is, it returns
  //the appropriate damage multiplier. (i.e. Water Pokemon deal
  //1.5 times the damage to fire Pokemon)
  func getMultiplierWithEnemy (enemy: Pokemon) -> Double {
    var selfType = self.type
    var multiplier = 0.0
    switch selfType {
    case .Fire:
      if enemy.type == .Grass {
        multiplier = 1.5
      } else if enemy.type == .Water {
        multiplier = 0.5
      } else {
        multiplier = 1.0
      }
      return multiplier
    case .Grass:
      if enemy.type == .Water {
        multiplier = 1.5
      } else if enemy.type == .Fire {
        multiplier = 0.5
      } else {
        multiplier = 1.0
      }
      return multiplier
    case .Water:
      if enemy.type == .Fire {
        multiplier = 1.5
      } else if enemy.type == .Grass {
        multiplier = 0.5
      } else {
        multiplier = 1.0
      }
      return multiplier
    }
  }
}


//Charmander inherits from Pokemon and is a fire pokemon with Ember.
class Charmander : Pokemon{
  var ember: Double = 10
  func useEmberOn (enemy : Pokemon){
    var healthLeft = enemy.health
    var multiplier = getMultiplierWithEnemy(enemy)
    checkEnemyHealthWithMultiplier(multiplier, atkDmg: self.ember, healthLeft: healthLeft, enemy: enemy)
  }
}

//Charmeleon inherits from Charmander and is a fire pokemon with Fireblast.
class Charmeleon : Charmander{
  var fireblast: Double = 20
  func useFireblastOn (enemy : Pokemon){
    var healthLeft = enemy.health
    var multiplier = getMultiplierWithEnemy(enemy)
    checkEnemyHealthWithMultiplier(multiplier, atkDmg: self.fireblast, healthLeft: healthLeft, enemy: enemy)
  }
}

//Charard inherits from Charmeleon and is a fire pokemon with Flamethrower.
class Charzard : Charmeleon{
  var flamethrower: Double = 30
  func useFlamethrowerOn (enemy : Pokemon){
    var healthLeft = enemy.health
    var multiplier = getMultiplierWithEnemy(enemy)
    checkEnemyHealthWithMultiplier(multiplier, atkDmg: self.flamethrower, healthLeft: healthLeft, enemy: enemy)
  }
}

let myCharzard = Charzard(name: "Derp", type: .Fire, 20, health: 200)
let myCharmel = Charmeleon(name: "Herp", type: .Fire, 15, health: 150)

//
func encounter (playerOne : Pokemon, playerTwo: Pokemon) {
  while (playerOne.isAlive && playerTwo.isAlive) {
    println("\(playerOne.name) choose your attack!")
    
  }
}

//Bulbasaur inherits from Pokemon and is a grass pokemon with razorLeaf.
class Bulbasaur : Pokemon {
  var razorLeaf: Double = 10
  func useRazorLeafOn (enemy : Pokemon) {
    var healthLeft = enemy.health
    var multiplier = getMultiplierWithEnemy(enemy)
    checkEnemyHealthWithMultiplier(multiplier, atkDmg: self.razorLeaf, healthLeft: healthLeft, enemy: enemy)
  }
}

let myBulba = Bulbasaur(name: "Saur", type: .Grass)

/*
//Ivysaur inherits from Bulbasaur and is a grass pokemon with Vinewhip.
class Ivysaur : Bulbasaur {
  var vineWhip: Double = 20
  func useVineWhipOn (enemy : Pokemon) {
    var healthLeft = enemy.health
    var multiplier = getMultiplierWithEnemy(enemy)
    checkEnemyHealthWithMultiplier(multiplier, atkDmg: self.vineWhip, healthLeft: healthLeft, enemy: enemy)
  }
}

//Venasaur inherits from Ivyasaur and is a grass pokemon with Hyperbeam.
class Venusaur : Ivysaur {
  var hyperBeam: Double = 30
  func useHyperBeamOn (enemy : Pokemon) {
    var healthLeft = enemy.health
    var multiplier = getMultiplierWithEnemy(enemy)
    checkEnemyHealthWithMultiplier(multiplier, atkDmg: self.hyperBeam, healthLeft: healthLeft, enemy: enemy)
  }
}

//Squirtle inherits from Pokemon and is a water pokemon with bubble.
class Squirtle : Pokemon {
  var bubble: Double = 10
  func useBubbleOn (enemy : Pokemon) {
    var healthLeft = enemy.health
    var multiplier = getMultiplierWithEnemy(enemy)
    checkEnemyHealthWithMultiplier(multiplier, atkDmg: self.bubble, healthLeft: healthLeft, enemy: enemy)
  }
}

//Warturtle inherits from Squirtle and is a water pokemon with Waterblast.
class WarTurtle : Squirtle {
  var waterBlast: Double = 20
  func useBubbleOn (enemy : Pokemon) {
    var healthLeft = enemy.health
    var multiplier = getMultiplierWithEnemy(enemy)
    checkEnemyHealthWithMultiplier(multiplier, atkDmg: self.waterBlast, healthLeft: healthLeft, enemy: enemy)
  }
}

//Blastoise inherits from Warturtle and is a water pokemon with Hydrocannon.
class Blastoise : WarTurtle {
  var hydroCannon: Double = 30
  func useHydroCannonOn (enemy : Pokemon) {
    var healthLeft = enemy.health
    var multiplier = getMultiplierWithEnemy(enemy)
    checkEnemyHealthWithMultiplier(multiplier, atkDmg: self.hydroCannon, healthLeft: healthLeft, enemy: enemy)
  }
}

//Magikarp inherits from Pokemon and is a water pokemon with Splash
//Warning it does no damage with splash
class Magikarp : Pokemon {
  var splash: Double = 0
  func useSplashOn (enemy : Pokemon) {
    var healthLeft = enemy.health
    var multiplier = getMultiplierWithEnemy(enemy)
    checkEnemyHealthWithMultiplier(multiplier, atkDmg: self.splash, healthLeft: healthLeft, enemy: enemy)
  }
}

//Gyarados inherits from Magikarp and is a water pokemon with Hydrocannon and hyperbeam.
class Gyarados : Magikarp {
  var hydroCannon: Double = 30
  var hyperBeam: Double = 30
  func useHydroCannonOn (enemy : Pokemon) {
    var healthLeft = enemy.health
    var multiplier = getMultiplierWithEnemy(enemy)
    checkEnemyHealthWithMultiplier(multiplier, atkDmg: self.hydroCannon, healthLeft: healthLeft, enemy: enemy)
  }
  func useHyperBeamOn (enemy : Pokemon) {
    var healthLeft = enemy.health
    var multiplier = getMultiplierWithEnemy(enemy)
    checkEnemyHealthWithMultiplier(multiplier, atkDmg: self.hyperBeam, healthLeft: healthLeft, enemy: enemy)
  }
} */
