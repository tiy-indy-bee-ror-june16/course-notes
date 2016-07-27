console.log("Howdy folks!")

our_class = ["Isai", "Dani", "Sean", "Mari"]

our_class.forEach(function(name){
  console.log(name + " is awesome and stuff")
})

function four_words(string){
  return string.length == 4
}

shorty = our_class.filter(function(name){
  return four_words(name)
})

console.log(shorty)

console.log(four_words("chris"))

function Robot(name, height, intelligence){

  this.name = name || "Bender"
  this.height = height || 60
  this.intelligence = intelligence || 30
  this.bend = function bend(thing){
    console.log("Bend " + thing + "!")
  }

}

function ActorRobot(name, height, intelligence, role){
  this.base = Robot
  this.base(name, height, intelligence)
  this.role = role
  this.emote = function(phrase){
    alert(phrase)
  }
}



shorty.forEach(function(name){
  document.getElementById('primary').innerHTML += "<p>" + name + " is a four-letter word</p>"
})

robots = ["Bender", "Calculon", "Hal", "Robbie"].map(function(name){
  return new ActorRobot(name, Math.random() * 100, Math.random() * 100)
})
console.log(robots)

function smart(number){
 if(number > 20) {
   return "smart"
 } else {
   return "dumb as a box of rocks"
 }
}

document.getElementById('secondary').innerHTML = "<ul>"
robots.forEach(function(robot){
  document.getElementById('secondary').innerHTML += "<li>" + robot.name + " is " + smart(robot.intelligence) + "</li>"
})
document.getElementById('secondary').innerHTML += "</ul>"

players = [
  { name: "Andrew", position: "QB", college: "Stanford", salary: "$150M", favorite_teammates: ["TY", "McAfee"]},
  { name: "McAfee", position: "P/K", college: "West Virginia", salary: "$5M", favorite_teammates: ["Vinateri", "Andrew"]}
]

console.log(players)

document.getElementById('click_me').addEventListener('click', function(ev){
  ev.target.className += "red"
  ev.preventDefault()
})
