const Asteroid = require("./asteroid");
const Util = require("./util");



function Game() { 

  this.asteroids = [];
  this.addAsteroids();
}


Game.DIM_X = 500;
Game.DIM_Y = 500;
Game.NUM_ASTEROIDS = 25;

Game.prototype.addAsteroids = function() { 
  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) { 
    this.asteroids.push(new Asteroid({game: this}));
  }
}

Game.prototype.randomPosition = function() {
  return [
    Game.DIM_X * Math.random(),
    Game.DIM_Y * Math.random()
  ];
};

Game.prototype.draw = function (ctx) {
  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);

  this.asteroids.forEach(function (asteroid) {
    asteroid.draw(ctx);
  });
}
 
Game.prototype.moveObjects = function () { 
  this.asteroids.forEach(function (asteroid) {
    asteroid.move();
  });
}
