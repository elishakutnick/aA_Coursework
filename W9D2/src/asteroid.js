const Util = require("./util");
const MovingObject = require("./moving_object");

const DEFAULTS = {
  COLOR: 'blue',
  RADIUS: 25,
  SPEED: 50,
};

function Asteroid(options) {
  options = options || {};
  options.color = DEFAULTS.COLOR;
  options.pos = options.pos || options.game.randomPosition();
  options.radius = DEFAULTS.RADIUS;
  options.vel = Util.randomVec(DEFAULTS.SPEED);

  MovingObject.call(this, options);
}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
